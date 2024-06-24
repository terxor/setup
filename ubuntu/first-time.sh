# TODO: Complete and test this script

cd $HOME
mkdir -p workspace bin
cd workspace

sudo apt-get update
sudo apt-get --assume-yes install \
  git \
  curl \
  zsh \
  fzf \
  silversearcher-ag \
  vim-gtk3 \
  g++ \
  gnome-tweak-tool \
  build-essential \
;

echo "Packages installed"

git clone https://github.com/terxor/setup

# ydiff
curl -L https://raw.github.com/ymattw/ydiff/master/ydiff.py > ~/bin/ydiff
chmod +x ~/bin/ydiff

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

chsh $(which zsh)
