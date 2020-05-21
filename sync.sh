#!/bin/bash

# Dotfiles location
DOTS="$HOME/repos/dotfiles"

# ----------------------------- Install packages ----------------------------- #

sudo pacman -S - <packages/pacman-packages.txt

cd $HOME

# Install antigen for zsh
curl -L git.io/antigen >antigen.zsh

# Make zsh default
chsh -s $(which zsh)

# Install base16 for colors
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Set auto timezone
timedatectl set-ntp true

# ------------------------------ Symbolic links ------------------------------ #

echo "Setting up symlinks"

ln -sfnv $DOTS/.scripts $HOME
ln -sfnv $DOTS/picom $HOME/.config
ln -sfnv $DOTS/i3 $HOME/.config
ln -sfnv $DOTS/kitty $HOME/.config
ln -sfnv $DOTS/ranger/* $HOME/.config
ln -sfnv $DOTS/rofi $HOME/.config
ln -sfnv $DOTS/vim/.vim $HOME/.config
ln -sfnv $DOTS/vim/.vimrc $HOME
ln -sfnv $DOTS/zathura $HOME/.config
ln -sfnv $DOTS/.zshrc $HOME
ln -sfnv $DOTS/.profile $HOME
ln -sfnv $DOTS/.clang-format $HOME
ln -sfnv $DOTS/qutebrowser $HOME/.config
ln -sfnv $DOTS/kicad $HOME/.config
ln -sfnv $DOTS/polybar $HOME/.config
# ln -sv $DOTS/i3blocks $HOME/.config/
# ln -sv $DOTS/wall.png $HOME/Pictures/

# ----------------------------------- Nvim ----------------------------------- #

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enter Neovim and install plugins using a temporary init.vim
# which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' init.vim >~/.config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

ln -sfnv $DOTS/nvim $HOME/.config

# -------------------------------- X11 Config -------------------------------- #

# sudo ln -sfnv $DOTS/X11/xorg.conf /etc/X11/
# sudo ln -sfnv $DOTS/X11/xorg.conf.d /etc/X11/
