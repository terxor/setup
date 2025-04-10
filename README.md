# Setup

Linux general environment setup, primarily:
- Terminal (Alacritty)
- tmux
- vim/neovim
- i3

> Note: Tested only on Ubuntu

## Get started

Download script, inspect and execute:

```
curl -o /tmp/setup.sh https://raw.githubusercontent.com/terxor/setup/main/setup.sh
# Inspect setup.sh
bash -c /tmp/setup.sh
```

Or, directly execute:

```
bash -c "$(wget -qO- https://raw.githubusercontent.com/terxor/setup/main/setup.sh)"
```

## Conventions

- Configurations go into `$HOME/.config`
- Binaries or scripts go into `$HOME/.local/bin`

## Miscellaneous stuff

### Tex

For tex, look at install instructions on [tex live official website](https://tug.org/texlive/quickinstall.html#running)
  
Reiterated here:

```
cd ~/workspace/scratch
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*
perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install --texdir=$HOME/bin/texlive

# Now, add the following line to your shell init
export PATH=$PATH:$HOME/bin/texlive/bin/x86_64-linux

# Install additional packages
tlmgr install titlesec
tlmgr install enumitem
```

### C++ code formatting

`apt install clang-format`

Normally this tool will work using stdin/stdout

To reformat a file in-place: `clang-format -i src.cc`

### Alacritty/WSL setup

```
curl -o "%USERPROFILE%\AppData\Roaming\alacritty\alacritty.toml" https://raw.githubusercontent.com/terxor/setup/refs/heads/staging/config/.alacritty.toml
```

### Touchpad issues

In  `/etc/X11/xorg.conf.d/touchpad-tap.conf` add the following

> Note: requires sudo

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
EndSection
```

### NPM and language servers

```
sudo apt install nodejs npm
sudo npm i -g pyright
```

```
sudo apt-get install clangd-19
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-19 100
```

### Iosevka font

https://github.com/be5invis/Iosevka/releases/download/v33.2.0/PkgTTF-IosevkaTerm-33.2.0.zip

***

