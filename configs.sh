#!/bin/bash

# install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

echo 'eval \$(${HOMEBREW_PREFIX}/bin/brew shellenv)' >> ${shell_profile}
eval \$(${HOMEBREW_PREFIX}/bin/brew shellenv)

source ${shell_profile}

brew install zsh

# install antigen
curl -L git.io/antigen > ~/antigen.zsh

# install zsh config
curl -L https://raw.githubusercontent.com/evanextreme/configs/master/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/evanextreme/configs/master/.p10k.zsh > ~/.p10k.zsh

# set up git lg alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
