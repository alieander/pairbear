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

commands =
  active : "echo $(/usr/local/bin/chunkc tiling::query --desktop id)"
  name   : "osascript -e 'tell application \"System Events\"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'"

command: "echo " +
          "$(#{commands.active}):::" +
          "$(#{commands.name}):::"


#command: "echo $(/usr/local/bin/chunkc tiling::query --desktop id)"

refreshFrequency: 1000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/font-awesome.min.css" />

  <ul class="spaces">
  </ul>
  """

update: (output) ->
  output = output.split(/:::/g)
  @handleSpaces(output)

handleSpaces: (list) ->
  $(".spaces").empty()
  $("<li>").prop("id", 1).addClass('apple').text("").appendTo(".spaces")
  $("<li>").prop("id", 2).addClass('space').text("#{list[0]}").appendTo(".spaces")
  $("<li>").prop("id", 3).addClass('current').text("#{list[1]}").appendTo(".spaces")

style: """
  .spaces
    display: flex
    padding-left: 18px

  ul
    list-style: none
    margin: 0 0 0 -18px

  li
    display: inline
    padding: 4px 18px 0px 18px
    margin: -3px
    height: 21px
    color: #{colors.base3}

  .current
    background-color: #{colors.base01}
    color: #{colors.base1}

  .apple
    padding: 4px 0px 0px 11px
    width: 22px
    background-color: #{colors.base2}
    color: #{colors.base01}
    border-bottom-left-radius: 6px


  top: 0px
  left: 0px
  height: 22px
  margin-left: 22px
  font-family: 'SauceCodePro Nerd Font' 
  font-size: 14px
  font-smoothing: antialiasing
  background-color: #{colors.base1}
  box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.0)
  z-index: 0
"""
