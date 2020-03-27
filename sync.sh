#!/bin/bash

# Install all snap packages
# snap-packages.txt xargs sudo snap install

# Install packages from a file, and remove all the comments inside!
# sudo apt install $(grep -vE "^\s*#" apt-packages.txt | tr "\n" " ")
sudo pacman -S - <packages/pacman-packages.txt

cd $HOME

# Install antigen for zsh
curl -L git.io/antigen >antigen.zsh

# Dotfiles location
DOTS="$HOME/repos/dotfiles"

# Make zsh default
chsh -s $(which zsh)

# Initial setup of folders, repo and symlinks!
# if [ "$already_setup" != true ]; then
echo "Setting up repos directories"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Set auto timezone
timedatectl set-ntp true

sudo pacman

# cd $HOME
# rm -rf .scripts .zshrc .vimrc
# cd .config
# rm -rf i3 i3blocks rofi .vim zathura compton kitty ranger
# sudo rm -rf /etc/X11/xorg.conf /etc/X11/xorg.conf.d

# cd $HOME
# mkdir -p repos

# cd repos

# Symbolic links!
ln -sfnv $DOTS/.scripts $HOME/
ln -sfnv $DOTS/picom $HOME/.config/
ln -sfnv $DOTS/i3 $HOME/.config/
ln -sfnv $DOTS/kitty $HOME/.config
ln -sfnv $DOTS/ranger $HOME/.config
ln -sfnv $DOTS/rofi $HOME/.config/
ln -sfnv $DOTS/vim/.vim $HOME/.config/
ln -sfnv $DOTS/vim/.vimrc $HOME/
ln -sfnv $DOTS/zathura $HOME/.config/
ln -sfnv $DOTS/.zshrc $HOME/
ln -sfnv $DOTS/.clang-format $HOME
ln -sfnv $DOTS/qutebrowser $HOME/.config
ln -sfnv $DOTS/kicad $HOME/.config
ln -sfnv $DOTS/polybar $HOME/.config
# sudo ln -sfnv $DOTS/X11/xorg.conf /etc/X11/
# sudo ln -sfnv $DOTS/X11/xorg.conf.d /etc/X11/

# ln -sv $DOTS/wall.png $HOME/Pictures/
# ln -sv $DOTS/i3blocks $HOME/.config/
# fi

# cd $DOTS
# git pull

# echo $PWD

# echo "Hello world!"
