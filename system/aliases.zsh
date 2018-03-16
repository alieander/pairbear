# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(which gls &>/dev/null)
then
  gls_command='gls'
  gls_color='--color'
else
  gls_command='ls'
  gls_color='-G'
fi

alias ls="$gls_command -F $gls_color"
alias l="$gls_command -lAh $gls_color"
alias ll="$gls_command -l $gls_color"
alias la="$gls_command -A $gls_color"
