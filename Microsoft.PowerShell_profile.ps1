if ($env:TERM_PROGRAM -ne "vscode") {
    & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\1_shell.omp.json" --print) -join "`n"))
}

Import-Module Terminal-Icons
Import-Module posh-git
Set-Alias g git
function Init-Dev { pnpm dev | npm run dev }
Set-Alias d Init-Dev

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function Git-Checkout {
    param ([Parameter(Mandatory=$true)][string]$branch)
    git checkout $branch
    git pull origin $branch
}
Set-Alias -Name gcp -Value Git-Checkout

function Git-Checkout {
    param ([Parameter(Mandatory=$true)][string]$branch)
    git checkout $branch
}
Set-Alias -Name gck -Value Git-Checkout

Set-Alias -Name gcks -Value "git checkout"

function Git-ListBranches { git branch --all }
Set-Alias -Name gbl -Value Git-ListBranches

function Git-Push { git push -u origin main --force }
Set-Alias -Name ggp -Value Git-Push

function Git-CommitWithMessage { param([string]$message) git commit -m $message }
Set-Alias -Name gcmv -Value Git-CommitWithMessage
