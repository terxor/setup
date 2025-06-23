#!/bin/bash

set -euo pipefail

install_package() {
  sudo apt-get install -y $1
}

sudo apt update -y

# GUI extn.
install_package i3blocks
install_package feh
install_package picom
install_package rofi

# Extension
install_package autorandr
install_package fonts-firacode
install_package markdownlint
install_package ffmpeg
install_package nodejs
install_package npm
install_package libtext-lorem-perl
install_package obs-studio
install_package python3-venv

# Problematic
# This one works on gdm
# install_package network-manager-applet
