Import-Module -Name posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Set-Theme Powerlevel10k-Lean
$DefaultUser = 'evhirsh'

# Keys for anywhere
function Get-CD { Set-Location $args[0]; Get-LS }
Set-Alias -Name cd -Value Get-CD -Option AllScope

function Get-LS { Get-ChildItem -Path $args[0] -Force | Format-Wide -AutoSize }
Set-Alias -Name ls -Value Get-LS -Option AllScope

function Run-GitStatus { git status $args[0] }
Set-Alias -Name gs -Value Run-GitStatus -Option AllScope

function Get-E { explorer $args[0] }
Set-Alias -Name e -Value Get-E -Option AllScope

function Get-Which { Where-Object $args[0] }
Set-Alias -Name which -Value Get-Which -Option AllScope

function Get-Hosts { hosts=notepad %WINDIR%\system32\drivers\etc\hosts }
Set-Alias -Name hosts -Value Get-Hosts -Option AllScope

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Autosuggestion for commands upon typing
set-psreadlineoption -predictionsource history
get-psreadlineoption | % predictionsource

# Alias open
New-Alias open ii
