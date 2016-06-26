autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  s1=$(which ruby)
  if [[ "$s1" != '/usr/bin/ruby' ]]
  then
    echo "%{$fg_bold[yellow]%}$(ruby --version | awk '{print $2}')%{$reset_color%}"
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

r_directory_name(){
  echo "%{$fg_bold[red]%}%/%\/%{$reset_color%}"
}

host_prompt(){
  echo "%{$fg_bold[yellow]%}%m%{$reset_color%}"
}

smilies(){
  echo "%(?.%{$fg_bold[green]%}:%)%{$reset_color%}.%{$fg_bold[red]%}:(%{$reset_color%})"
}

export PROMPT=$'\n$(host_prompt) in $(directory_name) $(git_dirty)$(need_push)\n$(smilies)  '
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
set_prompt () {
  export RPROMPT="$(r_directory_name) $(rb_prompt) "
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
