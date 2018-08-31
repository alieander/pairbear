refreshFrequency: false

colors =
  white   : "#D8DEE9"
  base03  : "#002b36"
  base02  : "#073642"
  base01  : "#586e75"
  base00  : "#657b83"
  base0   : "#839496"
  base1   : "#93a1a1"
  base2   : "#eee8d5"
  base3   : "#fdf6e3"
  yellow  : "#b58900"
  orange  : "#cb4b16"
  red     : "#dc322f"
  magenta : "#d33682"
  violet  : "#6c71c4"
  blue    : "#268bd2"
  cyan    : "#2aa198"
  green   : "#859900"

render: (output) ->
  ""

style: """
    top: 0
    margin-left: 22px
    margin-right: 22px
    width: 98.6%
    height: 22px
    background-color: #{colors.base02}
    opacity: 0.9125
    z-index: -1
    box-shadow: 0px 4px 10px 4px rgba(0,0,0,0.40)
    border-bottom-left-radius: 6px
    border-bottom-right-radius: 6px
"""
