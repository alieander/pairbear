# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub) >/dev/null 2>&1
if [[ -f $hub_path ]]
then
  alias git=$hub_path
  alias gpr="git pull-request"
fi

# The rest of my fun git aliases
#alias gl='git pull --prune'
alias glog="git --no-pager log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative -10"
alias glogf="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git pull'
alias gpl='git pull'
alias gd='git diff'
alias gdt='git difftool'
alias gc='git commit -v'
alias ga='git add'
alias gca='git commit -av'
alias ga='git add '
alias g.='git add .'
alias gco='git checkout'
alias gb='git checkout -b '
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gis='git status '
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gsu="git push --set-upstream origin "
# Delete a branch both locally and on the server
alias gitdelete="!sh -c 'git push origin :refs/heads/$1 && git remote prune origin && git branch -D $1' -"
