if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/zsh/functions $fpath)

autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

##
# http://linux.die.net/man/1/zshoptions
#
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt LOCAL_OPTIONS    # allow functions to have local options
setopt LOCAL_TRAPS      # allow functions to have local traps
setopt NO_LIST_BEEP
setopt PROMPT_SUBST

setopt APPEND_HISTORY       # adds history
setopt EXTENDED_HISTORY     # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY          # don't execute history right away, instead set prompt to command
setopt INC_APPEND_HISTORY   # adds history incrementally and share it across sessions
setopt SHARE_HISTORY        # share history between sessions

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt COMPLETE_ALIASES

#zle -N newtab # unknown

#bindkey '^[^[[D' backward-word
#bindkey '^[^[[C' forward-word
#bindkey '^[[5D' beginning-of-line
#bindkey '^[[5C' end-of-line
#bindkey '^[[3~' delete-char
#bindkey '\e[3~' delete-char
#bindkey '^[^N' newtab
#bindkey '^?' backward-delete-char

bindkey -e # emacs bindings

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
