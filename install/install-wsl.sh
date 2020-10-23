sudo apt update
sudo apt upgrade

sudo apt install neovim
ln -s ~/dotfiles/config/nvim ~/.config/nvim

# == Tmux
sudo apt install tmux
ln -s ~/dotfiles/config/.tmux.conf ~/.tmux.conf

echo $'\nsource ~/dotfiles/config/bash-wsl' >> .bashrc

mkdir ~/workbench
