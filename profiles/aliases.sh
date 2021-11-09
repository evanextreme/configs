# Aliases for Linux
alias git="hub"
alias weather="curl https://wttr.in\?0"

# Aliases for Windows

# use Windows' git when working under any mounted drives (such as C:\)
# modified from https://github.com/microsoft/WSL/issues/4401
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}
# wrap the git command to either run windows git or linux
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}

# Aliases to PWSH7
alias pwsh="pwsh.exe"
alias winget="pwsh.exe -c \"winget $@\""
alias scoop="pwsh.exe -c \"scoop $@\""

# Aliases to CMD
alias cmd="cmd.exe"
alias choco="cmd.exe -c \'sudo choco $@\'"
alias wsl="wsl.exe"
