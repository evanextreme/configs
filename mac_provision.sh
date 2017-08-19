#!/bin/sh

echo "Welcome to evanextreme/configurations! This script automatically configures all enviornments in the configurations directory, replacing your current ones."
echo "All your current .*rc files and enviornments will be moved to the ~/oldenv directory before being overwritten. Now..."
echo "OK~ Let's configure some \033[0;31mEXTREME\033[0m enviornments!"
git pull
echo "Configure main enviornments? (Homebrew, Vim, ZSH) [\033[0;32mY\033[0m,\033[0;31mn\033[0m]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    
    mkdir ~/.oldenv
    cd ./enviornments
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install vim
    echo "Downloading Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Configuring vim backup"
    mkdir ~/.vim/backup
    mkdir ~/.vim/tmp
    echo "Backed up current ~/.vimrc to ~/oldenv/.vimrc"
    mv ~/.vimrc ~/oldenv/.vimrc
    echo "Installing EXTREME ~/.vimrc"
    cp ./vimrc ~/.vimrc
    echo "Installing zsh"
    brew install zsh
    echo "Installing OhMyZsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Backed up current ~/.zshrc to ~/oldenv/.zshrc"
    mv ~/.zshrc ~/oldenv/.zshrc
    echo "Installing EXTREME ~/.zshrc"
    cp ./zshrc ~/.zshrc

    cd ../

else
    echo "Skipping enviornment configuration"
fi


echo "Install brew packages? This installs all packages located in packages/mac.txt [\033[0;32mY\033[0m,\033[0;31mn\033[0m]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    cd ./packages
    while read p; do
          echo "installing $p"
          brew install $p
    done < mac.txt

    cd ../
else
    echo "Skipping package installation"
fi


echo "Install brew casks? This installs all programs located in packages/mac_casks.txt [\033[0;32mY\033[0m,\033[0;31mn\033[0m]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    cd ./packages
    while read p; do
          echo "installing $p"
          brew cask install $p
    done < mac_casks.txt

    cd ../
else
    echo "Skipping cask installation configuration"
fi
