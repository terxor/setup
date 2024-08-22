#!/bin/sh

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

sudo apt-get update -y >/dev/null 2>&1
print_status "update package list"

is_installed() {
  dpkg -l | grep -qw "$1"
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

install_package "git"
install_package "curl"
install_package "tree" # Recursive directory listing command
install_package "htop" # Interactive process viewer

if [ -d "$HOME/.oh-my-zsh" ]; then
  print_status "install omz" skip
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null 2>&1
  print_status "install omz"
fi

if [ -f "$HOME/bin/ydiff" ]; then
  print_status "install ydiff" skip
else
  mkdir -p "$HOME/bin"
  curl -L https://raw.github.com/ymattw/ydiff/master/ydiff.py > "$HOME/bin/ydiff" >/dev/null 2>&1
  chmod +x "$HOME/bin/ydiff"
  print_status "install ydiff"
fi

# --------------------------------
# configs setup
# --------------------------------
SETUP_REPO=$HOME/workspace/setup

if [ ! -d $SETUP_REPO ]; then
    mkdir -p $SETUP_REPO
    git clone https://github.com/terxor/setup $SETUP_REPO >/dev/null
    print_status "clone setup repo"
else
    print_status "clone setup repo" skip
fi

copy_file() {
  local src=$SETUP_REPO/config/$1
  local tgt=$HOME/$1

  if [ -e "$tgt" ]; then
    print_status "copy config $1" skip
  else
    cp $src $tgt
    print_status "copy config $1"
  fi
}

make_link() {
  local src=$SETUP_REPO/config/$1
  local tgt=$HOME/$1

  if [ -L "$tgt" ]; then
    print_status "make symlink $1" skip
  else
    ln -s $src $tgt &>/dev/null
    print_status "make symlink $1"
  fi
}

make_link .gitconfig
make_link .zshenv
make_link .vimrc
make_link .zshrc
copy_file .netrc

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_status "switch to zsh"
else
    print_status "switch to zsh" skip
fi
