#!/bin/bash



unameOut=$(uname -s)
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=macOS;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ $(uname -r) =~ WSL ]]; then
    machine=Windows
fi

function display_status () {
    if [ $machine = "macOS" ]; then
    osascript -e "display notification \"$1\" with title \"evanextreme/configs.sh\""
    fi
    echo "$1"
}

display_status "Starting configuration of ${machine} machine"

# install homebrew

if [ $(which brew) = "brew not found" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install zsh
    chsh -s $(which zsh)
fi

# install latest zsh, set shell to it


# install Oh My Zsh
if test -f "~/.oh-my-zsh/"; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install antigen
if test -f "~/antigen.zsh"; then
    curl -L git.io/antigen > ~/antigen.zsh
fi

# download personal zsh configs
#curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.zshrc > ~/.zshrc
#curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.p10k.zsh > ~/.p10k.zsh
#curl -L https://github.com/evanextreme/configs/blob/master/packages/zsh_plugins.txt > ~/.zshplugins

# Install homebrew packages

display_status "Installing homebrew packages..."
brew tap $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/packages/brew_taps.txt)
brew install $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/packages/brew_formulae.txt)

# if macOS
if [ $machine = "macOS" ]; then
    display_status "Installing homebrew casks..."
    brew install --cask $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/packages/brew_casks.txt)

    display_status "Installing mac app store apps..."
    mas install $(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/packages/mac_app_store.txt)

    display_status "Downloading iTerm2 profile..."
    # Configure iTerm2 profile
    curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula%2B.itermcolors > ~/Dracula.itermcolors
    open ~/Dracula.itermcolors
    rm ~/Dracula.itermcolors

elif [ $machine = "Linux" ]; then
    # TODO install snaps
    display_status "Installing snaps..."

elif [ $machine = "Windows" ]; then
    display_status "Installing winget packages..."
    # TODO install Windows packages (Winget)
    # TODO install Scoop in Powershell, install Scoop packages
    # TODO set windows terminal config
fi

# Install Powershell configs
display_status "Installing powershell configs..."
pwsh -c "$(curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/configs.ps1)" 
curl -L https://github.com/evanextreme/configs/blob/master/profiles/.oh-my-posh.omp.json > ~/.oh-my-posh.omp.json
curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/profile.ps1 > ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Install Awesome Vimrc Configs
if test -f "~/.vim_runtime"; then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# set up git lg alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
