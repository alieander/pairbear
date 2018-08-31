# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8
################################################################
# Utility functions
# This file holds some utility-functions for
# the powerlevel9k-ZSH-theme
# https://github.com/bhilburn/powerlevel9k
################################################################

# Exits with 0 if a variable has been previously defined (even if empty)
# Takes the name of a variable that should be checked.
function defined() {
  [[ ! -z "${(tP)1}" ]]
}

# Given the name of a variable and a default value, sets the variable
# value to the default only if it has not been defined.
#
# Typeset cannot set the value for an array, so this will only work
# for scalar values.
function set_default() {
  local varname="$1"
  local default_value="$2"

  defined "$varname" || typeset -g "$varname"="$default_value"
}

# Converts large memory values into a human-readable unit (e.g., bytes --> GB)
# Takes two arguments:
#   * $size - The number which should be prettified
#   * $base - The base of the number (default Bytes)
function printSizeHumanReadable() {
  typeset -F 2 size
  size="$1"+0.00001
  local extension
  extension=('B' 'K' 'M' 'G' 'T' 'P' 'E' 'Z' 'Y')
  local index=1

  # if the base is not Bytes
  if [[ -n $2 ]]; then
    local idx
    for idx in "${extension[@]}"; do
      if [[ "$2" == "$idx" ]]; then
        break
      fi
      index=$(( index + 1 ))
    done
  fi

  while (( (size / 1024) > 0.1 )); do
    size=$(( size / 1024 ))
    index=$(( index + 1 ))
  done

  echo "$size${extension[$index]}"
}

# Gets the first value out of a list of items that is not empty.
# The items are examined by a callback-function.
# Takes two arguments:
#   * $list - A list of items
#   * $callback - A callback function to examine if the item is
#                 worthy. The callback function has access to
#                 the inner variable $item.
function getRelevantItem() {
  local -a list
  local callback
  # Explicitly split the elements by whitespace.
  list=(${=1})
  callback=$2

  for item in $list; do
    # The first non-empty item wins
    try=$(eval "$callback")
    if [[ -n "$try" ]]; then
      echo "$try"
      break;
    fi
  done
}

# OS detection
case $(uname) in
    Darwin)
      OS='OSX'
      OS_ICON=$(print_icon 'APPLE_ICON')
      ;;
    CYGWIN_NT-* | MSYS_NT-*)
      OS='Windows'
      OS_ICON=$(print_icon 'WINDOWS_ICON')
      ;;
    FreeBSD)
      OS='BSD'
      OS_ICON=$(print_icon 'FREEBSD_ICON')
      ;;
    OpenBSD)
      OS='BSD'
      OS_ICON=$(print_icon 'FREEBSD_ICON')
      ;;
    DragonFly)
      OS='BSD'
      OS_ICON=$(print_icon 'FREEBSD_ICON')
      ;;
    Linux)
      OS='Linux'
      os_release_id="$(grep -E '^ID=([a-zA-Z]*)' /etc/os-release | cut -d '=' -f 2)"
      case "$os_release_id" in
        *arch*)
        OS_ICON=$(print_icon 'LINUX_ARCH_ICON')
        ;;
        *debian*)
        OS_ICON=$(print_icon 'LINUX_DEBIAN_ICON')
        ;;
       *ubuntu*)
        OS_ICON=$(print_icon 'LINUX_UBUNTU_ICON')
        ;;
       *elementary*)
        OS_ICON=$(print_icon 'LINUX_ELEMENTARY_ICON')
        ;;
       *fedora*)
        OS_ICON=$(print_icon 'LINUX_FEDORA_ICON')
        ;;
       *coreos*)
        OS_ICON=$(print_icon 'LINUX_COREOS_ICON')
        ;;
       *gentoo*)
        OS_ICON=$(print_icon 'LINUX_GENTOO_ICON')
        ;;
       *mageia*)
        OS_ICON=$(print_icon 'LINUX_MAGEIA_ICON')
        ;;
       *centos*)
        OS_ICON=$(print_icon 'LINUX_CENTOS_ICON')
        ;;
       *opensuse*|*tumbleweed*)
        OS_ICON=$(print_icon 'LINUX_OPENSUSE_ICON')
        ;;
       *sabayon*)
        OS_ICON=$(print_icon 'LINUX_SABAYON_ICON')
        ;;
       *slackware*)
        OS_ICON=$(print_icon 'LINUX_SLACKWARE_ICON')
        ;;
       *linuxmint*)
        OS_ICON=$(print_icon 'LINUX_MINT_ICON')
        ;;
       *alpine*)
        OS_ICON=$(print_icon 'LINUX_ALPINE_ICON')
        ;;
       *aosc*)
        OS_ICON=$(print_icon 'LINUX_AOSC_ICON')
        ;;
       *nixos*)
        OS_ICON=$(print_icon 'LINUX_NIXOS_ICON')
        ;;
       *devuan*)
        OS_ICON=$(print_icon 'LINUX_DEVUAN_ICON')
        ;;
       *manjaro*)
        OS_ICON=$(print_icon 'LINUX_MANJARO_ICON')
        ;;
        *)
        OS='Linux'
        OS_ICON=$(print_icon 'LINUX_ICON')
        ;;
      esac

      # Check if we're running on Android
      case $(uname -o 2>/dev/null) in
        Android)
          OS='Android'
          OS_ICON=$(print_icon 'ANDROID_ICON')
          ;;
      esac
      ;;
    SunOS)
      OS='Solaris'
      OS_ICON=$(print_icon 'SUNOS_ICON')
      ;;
    *)
      OS=''
      OS_ICON=''
      ;;
esac

# Determine the correct sed parameter.
#
# `sed` is unfortunately not consistent across OSes when it comes to flags.
SED_EXTENDED_REGEX_PARAMETER="-r"
if [[ "$OS" == 'OSX' ]]; then
  local IS_BSD_SED="$(sed --version &>> /dev/null || echo "BSD sed")"
  if [[ -n "$IS_BSD_SED" ]]; then
    SED_EXTENDED_REGEX_PARAMETER="-E"
  fi
fi
