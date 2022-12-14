fnm_path=$(which fnm) >/dev/null 2>&1
if [[ -f $fnm_path ]]
then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi
