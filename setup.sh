#!/usr/bin/env bash

BASE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

print_status() {
  [[ $? -eq 0 ]] && status='\033[0;32mDONE\033[0m' || status='\033[0;33mALREADY EXISTS\033[0m'
  echo -e "$1 $2: $status"
}

copy_no_ow() {
  SRC=$1
  DEST=$2
  if [[ -e "$DEST" ]]; then
    return 1
  fi
  cp $SRC $DEST
  return 0
}

copy_file() {
  copy_no_ow $BASE_DIR/config/$1 $1
  print_status "COPY" $1
}

make_link() {
  ln -s $BASE_DIR/config/$1 &>/dev/null
  print_status "LINK" $1
}

cd $HOME
echo "Starting setup"
make_link .gitconfig
make_link .zshenv
make_link .vimrc
make_link .zshrc
copy_file .netrc
