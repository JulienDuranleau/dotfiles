#!/bin/bash

pushd ~

# == Clone files
git clone https://github.com/JulienDuranleau/dotfiles.git ~/dotfiles

# == Update everything first
sudo apt update && sudo apt upgrade

# == Basic requirements
sudo apt install git curl feh xrandr firefox

# == ZSH
sudo apt install zsh
chsh -s /bin/zsh
# = oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/config/.zshrc ~/.zshrc

# == Scripts and executables
mkdir ~/bin

# == Terminal
sudo apt install qterminal
rm -r ~/.config/qterminal.org
ln -s ~/dotfiles/config/qterminal.org ~/.config/qterminal.org

# == NeoVim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip install --user neovim
pip3 install --user neovim
rm -r ~/.config/nvim
ln -s ~/dotfiles/config/nvim ~/.config/nvim

# == Tmux
sudo apt install tmux
rm ~/.tmux.conf
ln -s ~/dotfiles/config/.tmux.conf ~/.tmux.conf

# == Fonts
sudo apt install fonts-firacode

# == Utilities
sudo apt install xbindkeys
rm ~/.xbindkeysrc
ln -s ~/dotfiles/config/.xbindkeysrc ~/.xbindkeysrc

sudo apt install ripgrep

# == Spotify
snap install spotify

# == i3-gaps : Manual install
firefox https://github.com/Airblader/i3/wiki/Compiling-&-Installing

popd
