alias g="git"
alias git="nocorrect git"

alias gcr="git reset --soft HEAD^"
alias gse="git stash push -u -m"

alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -v"
alias gcd="git checkout develop"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias glog="git log --oneline --decorate --graph"
alias gp="git push"
alias gst="git status"

alias grprune="git remote prune origin"
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'
