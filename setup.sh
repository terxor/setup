#!/bin/bash

full=false
skip_update=false

# Parse command-line flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--full)
      full=true
      shift
      ;;
    -s|--skip_update)
      skip_update=true
      shift
      ;;
    -d|--debug)
      debug=true
      set -x # Enable xtrace debugging
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done

# Usage function
usage() {
  echo "Usage: $0 [-f|--full] [-d|--debug] [-s|--skip_update] [-h|--help]"
  echo "  -f, --full:    Full setup includes non-terminal components"
  echo "  -s, --skip_update:   Skip package update."
  echo "  -d, --debug:   Enable debug mode."
  echo "  -h, --help:    Display this help message."
}

# --- Utility functions ----------
print_status() {
  local status=$?
  local message=$1
  local skip=$2

  if [ "$skip" = "skip" ]; then
    printf "[\e[33mSKIP\e[0m] %s\n" "$message"
  else
    if [ "$status" -eq 0 ]; then
      printf "[\e[32mDONE\e[0m] %s\n" "$message"
    else
      printf "[\e[31mFAIL\e[0m] %s\n" "$message"
    fi
  fi
}

is_installed() {
  res="$(dpkg-query --show --showformat='${db:Status-Status}\n' "$1" 2> /dev/null)"
  if [ "$res" = installed ]; then 
    return 0
  else
    return 1
  fi
}

install_package() {
  local package=$1
  local action_name="install $package"

  if is_installed "$package"; then
    print_status "$action_name" skip
  else
    sudo apt-get install -y "$package" >/dev/null 2>&1
    print_status "$action_name"
  fi
}

silent() {
  $@ >/dev/null 2>&1
}
# --------------------------------

if [[ "$skip_update" != "true" ]]; then
  silent sudo apt-get update -y
  print_status "update package list"
fi

install_package git
install_package curl
install_package tree # Recursive directory listing command
install_package htop # Interactive process viewer
# install_package fzf # install manually
install_package silversearcher-ag
# install_package neovim
# install_package vim-gtk3
install_package g++
install_package build-essential
install_package zsh
install_package markdownlint
install_package fonts-firacode
install_package tmux
install_package stow # symlink management
install_package alacritty
install_package i3
install_package i3blocks
install_package feh

if [[ "$full" == "true" ]]; then
  install_package alacritty
  install_package i3
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
  print_status "install omz" skip
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null 2>&1
  print_status "install omz"
  # OMZ installation creates a default .zshrc
  rm -f "$HOME/.zshrc"
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/fzf-tab" ]; then
  print_status "install fzf-tab" skip
else
  silent git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
  print_status "install fzf-tab"
fi

SETUP_REPO=$HOME/workspace/setup

if [ ! -d $SETUP_REPO ]; then
    mkdir -p $SETUP_REPO
    silent git clone https://github.com/terxor/setup $SETUP_REPO
    print_status "clone setup repo"
else
    print_status "clone setup repo" skip
fi

# Create dirs which will get populated with other stuff
# so that stow doesn't link the dir
mkdir -p $HOME/.config/zsh
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.local/bin

# Create dotfiles symlinks
CUR_DIR=$(pwd)
cd $SETUP_REPO
stow -t $HOME --no-folding dotfiles
print_status "stow"
cd $CUR_DIR

if [ "$(which fzf)" ]; then
  print_status "install fzf" skip
else
  FZF_DIR=/tmp/fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR >/dev/null 2>&1
  $FZF_DIR/install --bin >/dev/null 2>&1
  print_status "install fzf"
  mv $FZF_DIR/bin/fzf $HOME/.local/bin/
  mv $FZF_DIR/shell/*.zsh $HOME/.local/bin/
  rm -rf $FZF_DIR
fi

if [ "$(which nvim)" ]; then
  print_status "install nvim" skip
else
  NVIM_PKG=https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
  curl -fsSL -o /tmp/nvim.tar.gz $NVIM_PKG
  tar -xzf /tmp/nvim.tar.gz -C $HOME/.local/ --strip-components=1
  rm /tmp/nvim.tar.gz
  print_status "install nvim"
fi

# Install iosevka
if [ "$(fc-list | grep Iosevka)" ]; then
  print_status "install font iosevka" skip
else
  # IOSEVKA_FONT_URL=https://github.com/be5invis/Iosevka/releases/download/v33.2.1/PkgTTF-Iosevka-33.2.1.zip
  # curl -fsSL -o /tmp/iosevka.zip $IOSEVKA_FONT_URL
  # unzip -d /tmp/iosevka /tmp/iosevka.zip
  mkdir -p $HOME/.local/fonts
  mv /tmp/iosevka/*.ttf $HOME/.local/share/fonts/
  fc-cache -f -v
  print_status "install font iosevka"
fi


if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_status "switch to zsh"
else
    print_status "switch to zsh" skip
fi

