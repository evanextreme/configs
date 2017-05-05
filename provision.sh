#!/bin/sh

echo "Welcome to evanextreme/configurations! This script automatically configures all enviornments in the configurations directory, replacing your current ones."
echo "All your current .*rc files and enviornments will be moved to the ~/oldenv directory before being overwritten. Now..."
echo "OK~ Let's configure some \033[0;31mEXTREME\033[0m enviornments!"
mkdir ~/oldenv
cd ./enviornments
echo "Configure \033[0;34mvim\033[0m enviornment? [\033[0;32mY\033[0m,\033[0;31mn\033[0m]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    echo "Downloading Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Configuring vim backup"
    mkdir ~/.vim/backup
    mkdir ~/.vim/tmp
    echo "Backed up current ~/.vimrc to ~/oldenv/.vimrc"
    mv ~/.vimrc ~/oldenv/.vimrc
    echo "Installing EXTREME ~/.vimrc"
    cp ./vimrc ~/.vimrc
else
    echo "Ok sounds good my dude ¯\_(ツ)_/¯"
fi
echo "Configure \033[0;34mzsh\033[0m enviornment? [\033[0;32mY\033[0m,\033[0;31mn\033[0m]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Backed up current ~/.vimrc to ~/oldenv/.vimrc"
    mv ~/.zshrc ~/oldenv/.zshrc
    echo "Installing EXTREME ~/.vimrc"
    cp ./zshrc ~/.zshrc
else
    echo "Ok sounds good my dude/dudette, no ZSH for you ¯\_(ツ)_/¯"
fi

