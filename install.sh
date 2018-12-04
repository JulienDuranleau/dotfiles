#!/bin/bash

pushd ~

# == Update everything first
sudo apt update && sudo apt upgrade

# == Basic requirements
sudo apt install git curl

# == Clone files
git clone https://github.com/JulienDuranleau/dotfiles.git ~/dotfiles

# == ZSH
sudo apt install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# == Scripts and executables
ln -s ~/dotfiles/scripts ~/scripts
mkdir ~/bin

# == NeoVim
sudo apt install nvim
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip install --user neovim
pip3 install --user neovim
ln -s ~/dotfiles/nvim ~/.config/nvim

# == Tmux
sudo apt install tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

popd
