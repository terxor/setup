#!/bin/bash

set -euo pipefail

REPO_BASE=https://github.com/terxor
WORKSPACE=$HOME/workspace
SETUP_REPO=$WORKSPACE/setup

if [ ! -d $SETUP_REPO ]; then
    mkdir -p $SETUP_REPO
    git clone $REPO_BASE/setup $SETUP_REPO
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
cd $CUR_DIR

if [ ! -d $WORKSPACE/utils ]; then
    mkdir -p $WORKSPACE/utils
    git clone $REPO_BASE/utils $WORKSPACE/utils
    $WORKSPACE/utils/install.sh
fi

