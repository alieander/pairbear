GPG_TTY=$(tty)
export GPG_TTY

if [ -f ~/.gnupg/.gpg-agent-info  ] && [ -n "$(pgrep gpg-agent)"  ]; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon -q)
fi
