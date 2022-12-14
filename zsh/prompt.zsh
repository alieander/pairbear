autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_prompt() {
  branch_name=$($git rev-parse --abbrev-ref HEAD 2>/dev/null)
  dirty=$(needs_push)
  if [[ ! $branch_name ]]
  then
  else
    if [[ $dirty == "" ]]
    then
      echo -n " $(print_icon VCS_BRANCH_ICON) $(fC green)$branch_name$(cC)"
      echo -n " $(untracked)"
    else
      echo -n " $(print_icon VCS_BRANCH_ICON) $(fC red)$branch_name$(cC)"
      echo -n " $(unpushed)$(untracked)"
    fi
  fi
  unset branch_name
  unset dirty
}

needs_push() {
  $git cherry -v @{upstream} 2>/dev/null
}

unpushed() {
  echo -n "$(fC magenta)$(print_icon VCS_UNSTAGED_ICON)$(fC) "
}

untracked() {
  if [[ -n $($git status --porcelain | grep -E '^\?\?' 2> /dev/null | tail -n1) ]]; then
    echo -n "$(fC yellow)$(print_icon 'VCS_UNTRACKED_ICON')$(cC)"
  fi
}

background_jobs(){
  background_jobs_number=${$(jobs -l | wc -l)// /}
  if [[ background_jobs_number -gt 0 ]]; then
    echo -n " $(fC blue)$(print_icon ASTERISK) $(print_icon LEFT_SUBSEGMENT_SEPARATOR)$(cC)"
  fi
  unset background_jobs_number
}

rb_prompt(){
  s1=$(which ruby)
  if [[ "$s2" != '/usr/bin/ruby' ]]
  then
    echo -n "$(fC yellow)$(print_icon RIGHT_SUBSEGMENT_SEPARATOR) " \
     "$(ruby --version | awk '{print $2}'| sed -E "s/p[0-9]+//")" \
     "$(fC red)$(print_icon RUBY_ICON)$(fC)"
  fi
  unset s1
}

py_prompt(){
  s1=$(pyenv versions | awk '/system/ {print $1}')
  if [[ "$s1" != '*' ]]
  then
    echo -n "$(fC green)$(print_icon RIGHT_SUBSEGMENT_SEPARATOR) " \
     "$(python --version | awk '{print $2}')" \
     "$(fC green)$(print_icon PYTHON_ICON)$(fC)"
  fi
  unset s1
}

directory_name(){
  echo " $(fC cyan)%1/ $(print_icon LEFT_SUBSEGMENT_SEPARATOR)$(cC)"
}

full_directory(){
  echo "$(fC red)%~%\/$(cC)"
}

host_prompt(){
  echo "$(fC yellow)%m $(fC yellow)$(print_icon LEFT_SUBSEGMENT_SEPARATOR)"
}

smilies(){
  echo "$(print_icon MULTILINE_LAST_PROMPT_PREFIX)%(?.$(fC green):%).$(fC red):()$(cC)"
}

left_segments(){
  echo "\n$(print_icon MULTILINE_FIRST_PROMPT_PREFIX)$(host_prompt)$(directory_name)$(background_jobs)$(git_prompt)"
}

right_segments(){
  echo "$(full_directory) $(rb_prompt) $(py_prompt)"
}

vim_prompt(){
  VIM_PROMPT=" $(fC yellow)$(print_icon CONSOLE_LINE)$(cC)"
  out="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
  if [[ $out == "" ]]
  then
    echo -n "  "
  else
    echo -n $out
  fi
  unset VIM_PROMPT
  unset out
}

PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PROMPT=$'$(left_segments)\n$(smilies)$(vim_prompt) '
set_prompt() {
  export RPROMPT="$(right_segments)"
}

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
