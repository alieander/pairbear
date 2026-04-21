# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8
################################################################
# icons
# This file holds the icon definitions and
# icon-functions for the powerlevel9k-ZSH-theme
# https://github.com/bhilburn/powerlevel9k
################################################################

# These characters require the Powerline fonts to work properly. If you see
# boxes or bizarre characters below, your fonts are not correctly installed. If
# you do not want to install a special font, you can set `POWERLEVEL9K_MODE` to
# `compatible`. This shows all icons in regular symbols.

# Initialize the icon list according to the user's `POWERLEVEL9K_MODE`.
typeset -gAH icons
local LC_ALL="" LC_CTYPE="en_US.UTF-8"
icons=(
  ASTERISK                       $'\uF069'              # 
  CONSOLE_LINE                   $'\u007E'              # ~
  LEFT_SEGMENT_SEPARATOR         $'\uE0B0'              # 
  RIGHT_SEGMENT_SEPARATOR        $'\uE0B2'              # 
  LEFT_SEGMENT_END_SEPARATOR     ' '                    # Whitespace
  LEFT_SUBSEGMENT_SEPARATOR      $'\uE0B1'              # 
  RIGHT_SUBSEGMENT_SEPARATOR     $'\uE0B3'              # 
  CARRIAGE_RETURN_ICON           $'\u21B5'              # ↵
  ROOT_ICON                      $'\uE614'             # 
  SUDO_ICON                      $'\uF09C'              # 
  RUBY_ICON                      $'\uF219'             # 
  AWS_ICON                       $'\uF270'              # 
  AWS_EB_ICON                    $'\UF1BD'            # 
  BACKGROUND_JOBS_ICON           $'\uF013'             # 
  TEST_ICON                      $'\uF188'              # 
  TODO_ICON                      $'\uF133'              # 
  BATTERY_ICON                   $'\UF240'             # 
  DISK_ICON                      $'\uF0A0'              # 
  OK_ICON                        $'\uF00C'              # 
  FAIL_ICON                      $'\uF00D'              # 
  SYMFONY_ICON                   $'\uE757'              # 
  NODE_ICON                      $'\uE617'             # 
  MULTILINE_FIRST_PROMPT_PREFIX  $'\u256D'$'\U2500'     # ╭─
  MULTILINE_NEWLINE_PROMPT_PREFIX  $'\u251C'$'\U2500'   # ├─
  MULTILINE_LAST_PROMPT_PREFIX   $'\u2570'$'\U2500'    # ╰─
  APPLE_ICON                     $'\uF179'              # 
  WINDOWS_ICON                   $'\uF17A'              # 
  FREEBSD_ICON                   $'\UF30C'             # 
  ANDROID_ICON                   $'\uF17B'              # 
  LINUX_ARCH_ICON                $'\uF303'              # 
  LINUX_CENTOS_ICON              $'\uF304'              # 
  LINUX_COREOS_ICON              $'\uF305'              # 
  LINUX_DEBIAN_ICON              $'\uF306'              # 
  LINUX_ELEMENTARY_ICON          $'\uF309'              # 
  LINUX_FEDORA_ICON              $'\uF30a'              # 
  LINUX_GENTOO_ICON              $'\uF30d'              # 
  LINUX_MAGEIA_ICON              $'\uF310'              # 
  LINUX_MINT_ICON                $'\uF30e'              # 
  LINUX_NIXOS_ICON               $'\uF313'              # 
  LINUX_MANJARO_ICON             $'\uF312'              # 
  LINUX_DEVUAN_ICON              $'\uF307'              # 
  LINUX_ALPINE_ICON              $'\uF300'              # 
  LINUX_AOSC_ICON                $'\uF301'              # 
  LINUX_OPENSUSE_ICON            $'\uF314'              # 
  LINUX_SABAYON_ICON             $'\uF317'              # 
  LINUX_SLACKWARE_ICON           $'\uF319'              # 
  LINUX_UBUNTU_ICON              $'\uF31b'              # 
  LINUX_ICON                     $'\uF17C'              # 
  SUNOS_ICON                     $'\uF185'             # 
  HOME_ICON                      $'\uF015'              # 
  HOME_SUB_ICON                  $'\uF07C'              # 
  FOLDER_ICON                    $'\uF115'              # 
  ETC_ICON                       $'\uF013'              # 
  NETWORK_ICON                   $'\uF1EB'              # 
  LOAD_ICON                      $'\uF080'             # 
  SWAP_ICON                      $'\uF464'              # 
  RAM_ICON                       $'\uF0E4'              # 
  SERVER_ICON                    $'\uF0AE'              # 
  VCS_UNTRACKED_ICON             $'\uF059'              # 
  VCS_UNSTAGED_ICON              $'\uF06A'              # 
  VCS_STAGED_ICON                $'\uF055'              # 
  VCS_STASH_ICON                 $'\uF01C'             # 
  VCS_INCOMING_CHANGES_ICON      $'\uF01A'             # 
  VCS_OUTGOING_CHANGES_ICON      $'\uF01B'             # 
  VCS_TAG_ICON                   $'\uF02B'             # 
  VCS_BOOKMARK_ICON              $'\uF461'             # 
  VCS_COMMIT_ICON                $'\uE729'             # 
  VCS_BRANCH_ICON                $'\uF126'             # 
  VCS_REMOTE_BRANCH_ICON         $'\uE728'             # 
  VCS_GIT_ICON                   $'\uF1D3'             # 
  VCS_GIT_GITHUB_ICON            $'\uF113'             # 
  VCS_GIT_BITBUCKET_ICON         $'\uE703'             # 
  VCS_GIT_GITLAB_ICON            $'\uF296'             # 
  VCS_HG_ICON                    $'\uF0C3'             # 
  VCS_SVN_ICON                   $'\uE72D'             # 
  RUST_ICON                      $'\uE7A8'             # 
  PYTHON_ICON                    $'\UE73C'             # 
  SWIFT_ICON                     $'\uE755'              # 
  GO_ICON                        $'\uE626'              # 
  PUBLIC_IP_ICON                 $'\UF0AC'              # 
  LOCK_ICON                      $'\UF023'              # 
  EXECUTION_TIME_ICON            $'\uF252'              # 
  SSH_ICON                       $'\uF489'              # 
  VPN_ICON                       '(vpn)'
  KUBERNETES_ICON                $'\U2388'              # ⎈
  DROPBOX_ICON                   $'\UF16B'              # 
  DATE_ICON                      $'\uF073'             # 
  TIME_ICON                      $'\uF017'             # 
  JAVA_ICON                      $'\U2615'              # ☕︎
  LARAVEL_ICON                   $'\ue73f'             # 
  MINUS_ICON                     $'\uf068'              # 
  PLUS_ICON                      $'\uf067'              # 
  TILDE_ICON                     $'\uf07E'              # 
)

# Safety function for printing icons
# Prints the named icon, or if that icon is undefined, the string name.
function print_icon() {
  local icon_name=$1
  echo -n "${icons[$icon_name]}"
}

# Get a list of configured icons
#   * $1 string - If "original", then the original icons are printed,
#                 otherwise "print_icon" is used, which takes the users
#                 overrides into account.
function get_icon_names() {
  # Iterate over a ordered list of keys of the icons array
  for key in ${(@kon)icons}; do
    echo -n "$key: "
    if [[ "${1}" == "original" ]]; then
      # print the original icons as they are defined in the array above
      echo "${icons[$key]}"
    else
      # print the icons as they are configured by the user
      echo "$(print_icon "$key")"
    fi
  done
}
