# Setup

## TLDR

**Please verify any script you are running from the internet.
Double check the path and contents before executing such scripts.**

```
sh -c "$(wget -qO- https://raw.githubusercontent.com/terxor/setup/main/setup.sh)"
```

## Ubuntu

### Configurations

Running `./setup.sh` will create symlinks for some dotfiles present in `/configs`

The env var `SETUP_REPO` is set in `.zshenv` and may need modification.
Present value is `~/workspace/setup`

### Packages

```
# Before
sudo apt update

# Basic/pre-requisites
sudo apt install git curl

# Shell/utility
sudo apt install zsh fzf silversearcher-ag vim-gtk3 tree

# Misc.
sudo apt install g++
sudo apt install gnome-tweak-tool
sudo apt install build-essential
```

More:
```
# For better diff viewing
curl -L https://raw.github.com/ymattw/ydiff/master/ydiff.py > ~/bin/ydiff
chmod +x ~/bin/ydiff
```

#### zsh customizations

`oh-my-zsh` and `fzf-tab`:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

### Terminal

In order to edit terminal settings through config:
```
# Load config to a text file
dconf dump /org/gnome/terminal/ > terminal.conf
# Apply config
cat terminal.conf | dconf load /org/gnome/terminal/
```

Here is a preset `terminal.conf`, simply apply it
```
[legacy]
theme-variant='light'

[legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
audible-bell=false
cursor-blink-mode='off'
font='Inconsolata 14'
login-shell=false
palette=['rgb(20,24,26)', 'rgb(166,37,36)', 'rgb(47,117,0)', 'rgb(176,137,4)', 'rgb(30,101,153)', 'rgb(113,25,128)', 'rgb(30,115,108)', 'rgb(128,125,114)', 'rgb(7,63,77)', 'rgb(222,51,48)', 'rgb(66,166,0)', 'rgb(219,171,5)', 'rgb(35,119,181)', 'rgb(169,37,191)', 'rgb(43,166,156)', 'rgb(166,161,149)']
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
visible-name='xv3'
```

Note: Color scheme for GNOME is generated from standard light theme in the following way:
  - 16 colors are in order: black, red, green, yellow, blue, purple, cyan, white (then their bright variants)
  - these are then stored in the `palette` array
  - Here are the derived values from xv3 light scheme
  - `palette=['rgb(20,24,26)', 'rgb(166,37,36)', 'rgb(47,117,0)', 'rgb(176,137,4)', 'rgb(30,101,153)', 'rgb(113,25,128)', 'rgb(30,115,108)', 'rgb(128,125,114)', 'rgb(7,63,77)', 'rgb(222,51,48)', 'rgb(66,166,0)', 'rgb(219,171,5)', 'rgb(35,119,181)', 'rgb(169,37,191)', 'rgb(43,166,156)', 'rgb(166,161,149)']`


### Misc stuff

- Ctrl-Caps swap
    Tweaks > Keyboard > Additional Layout Options >  Ctrl Position -> swap ctrl and caps lock

- Fonts:
    - Download and copy .ttf to ~/.local/share/fonts

- To hide the trash icon
  `gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false`

- For tex, look at install instructions on [tex live official website](https://tug.org/texlive/quickinstall.html#running)
  
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

***
