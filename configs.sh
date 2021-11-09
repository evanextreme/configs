#!/bin/zsh



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
if ! command -v brew >/dev/null; then
    display_status "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


# install latest zsh, set shell to it


# install Oh My Zsh
if ! command -v zsh >/dev/null; then
    display_status "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# download personal zsh configs

curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.p10k.zsh > ~/.p10k.zsh


# Install homebrew packages

display_status "Installing homebrew packages..."
curl -fsSL https://raw.githubusercontent.com/evanextreme/configs/main/packages/Brewfile > Brewfile
brew bundle

# if macOS
if [ $machine = "macOS" ]; then

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
curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.oh-my-posh.omp.json > ~/.oh-my-posh.omp.json
curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/profile.ps1 > ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Install Awesome Vimrc Configs
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# set up git aliases
curl -L https://raw.githubusercontent.com/evanextreme/configs/main/profiles/.vimrc > ~/.vimrc
