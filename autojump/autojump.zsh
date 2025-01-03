case $OSTYPE in
  *"darwin"*)
    [[ -e `brew --prefix`/etc/profile.d/autojump.sh ]] && . `brew --prefix`/etc/profile.d/autojump.sh
    ;;
  *"linux"*)
    [[ -e /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
    ;;
esac
