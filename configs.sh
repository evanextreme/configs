#!/bin/bash

OS_NAME=$(uname -s)

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source ${shell_profile}

# install latest zsh

brew install zsh

# install Oh My Zsh
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install antigen
curl -L git.io/antigen > ~/antigen.zsh

# # install zsh config
# curl -L https://raw.githubusercontent.com/evanextreme/configs/master/.zshrc > ~/.zshrc
# curl -L https://raw.githubusercontent.com/evanextreme/configs/master/.p10k.zsh > ~/.p10k.zsh
# curl -L https://github.com/evanextreme/configs/blob/master/.zsh_plugins.txt > ~/.zsh_plugins.txt

# Install homebrew packages

brew install $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/master/packages/brew_formulae.txt)

# if macOS
brew install --cask $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/master/packages/brew_casks.txt)

# TODO if linux
# TODO if WSL

# set up git lg alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
