# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
source /home/evan/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
# antigen bundle heroku
antigen bundle pip
# antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# # Load the theme.
antigen theme powerlevel10k

# Tell Antigen that you're done.
antigen apply
