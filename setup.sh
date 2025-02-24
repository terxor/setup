#!/bin/sh

# --- Utility functions ----------
print_status() {
  local status=$?
  local message=$1
  local skip=$2
  local width=40

  if [ "$skip" = "skip" ]; then
    printf "%-${width}s \e[90mSKIPPED\e[0m\n" "$message"
  else
    if [ "$status" -eq 0 ]; then
      printf "%-${width}s \e[32mDONE\e[0m\n" "$message"
    else
      printf "%-${width}s \e[31mFAILED\e[0m\n" "$message"
    fi
  fi
}

is_installed() {
  res="$(dpkg-query --show --showformat='${db:Status-Status}\n' "$1")"
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

silent sudo apt-get update -y
print_status "update package list"

install_package git
install_package curl
install_package tree # Recursive directory listing command
install_package htop # Interactive process viewer
install_package fzf
install_package silversearcher-ag
install_package vim-gtk3
install_package g++
install_package build-essential
install_package zsh
install_package markdownlint
install_package fonts-firacode
install_package alacritty
install_package tmux
install_package i3
install_package stow

if [ -d "$HOME/.oh-my-zsh" ]; then
  print_status "install omz" skip
else
  silent sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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

# Create dotfiles symlinks
CUR_DIR=$(pwd)
cd $SETUP_REPO
stow -t $HOME dotfiles
cd $CUR_DIR

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_status "switch to zsh"
else
    print_status "switch to zsh" skip
fi

