#!/bin/bash

# Initial setup of folders and repo!
if [ $already_setup != true ];
then
	echo "Setting up repos directories"
	cd ~
	mkdir -p repos
	cd repos
	echo "Cloning repo"
	git clone https://github.com/stavrosfil/dotfiles
fi

# Symbolic links!
ln -sv $PWD/.scripts $HOME/
ln -sv $PWD/compton $HOME/.config/
ln -sv $PWD/i3 $HOME/.config/
ln -sv $PWD/i3blocks $HOME/.config/
ln -sv $PWD/rofi $HOME/.config/

ln -sv $PWD/vim $HOME/.config/

ln -sv $PWD/zathura $HOME/.config/
ln -sv $PWD/.zshrc $HOME/

echo $PWD

echo "Hello world!"
