commands =
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
            "| cut -f1 -d';'"
  charging: "pmset -g batt | grep -c 'AC'"
  time   : "date +\"%H:%M:%S\""
  wifi   : "/System/Library/PrivateFrameworks/Apple80211.framework/" +
            "Versions/Current/Resources/airport -I | " +
            "sed -e \"s/^ *SSID: //p\" -e d"
  date   : "date +\"%a %d %b\""
  volume : "osascript -e 'output volume of (get volume settings)'"
  cpu    : "ESC=`printf \"\e\"`; ps -A -r -o %cpu | awk '{s+=$1} END {printf(\"%05.2f\",s/8);}'"
  disk   : "df -H -l / | awk '/\\/.*/ { print $5 }'"

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

command: "echo " +
          "$(#{commands.battery}):::" +
          "$(#{commands.charging}):::" +
          "$(#{commands.time}):::" +
          "$(#{commands.wifi}):::" +
          "$(#{commands.volume}):::" +
          "$(#{commands.date}):::" +
          "$(#{commands.cpu}):::" +
          "$(#{commands.disk}):::" 

refreshFrequency: 1000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/font-awesome.min.css" />

  <div class="volume">
    <span class="volume-icon"></span>
    <span class="volume-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="cpu">
    <i class="fa fa-area-chart"></i>
    <span class="cpu-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="disk">
    <i class="fa fa-hdd-o"></i>
    <span class="disk-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="wifi">
    <i class="fa fa-wifi"></i>
    <span class="wifi-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="battery">
    <span class="battery-icon"></span>
    <span class="battery-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="date">
    <i class="fa fa-calendar"></i>
    <span class="date-output"></span>
  </div>
  <span class="spacer">|</span>
  <div class="time">
    <i class="fa fa-clock-o"></i>
    <span class="time-output"></span>
  </div>
  """

update: (output) ->

  console.log(output)
  output = output.split( /:::/g )

  battery  = output[0]
  charging = output[1]
  time     = output[2]
  wifi     = output[3]
  volume   = if output[4] == 'missing value' then -1 else output[4]
  date     = output[5]
  cpu      = output[6]
  disk     = output[7]

  $(".battery-output") .text("#{battery}")
  $(".time-output")    .text("#{time}")
  $(".wifi-output")    .text("#{wifi}")
  $(".volume-output")  .text("#{volume}%")
  $(".date-output")    .text("#{date}")
  $(".cpu-output")     .text("#{cpu}%")
  $(".disk-output")    .text("#{disk}")

  @handleBattery(Number(battery.replace( /%/g, "")), charging == '1')
  @handleVolume(Number(volume))

handleBattery: ( percentage, charging ) ->
  if charging
    $(".battery-icon").html("<i class=\"fas fa-bolt \"></i>")  
    return

  batteryIcon = switch
    when percentage <=  12 then "fa-battery-0"
    when percentage <=  25 then "fa-battery-1"
    when percentage <=  50 then "fa-battery-2"
    when percentage <=  75 then "fa-battery-3"
    when percentage <= 100 then "fa-battery-4"

  $(".battery-icon").html("<i class=\"fa #{batteryIcon} \"></i>")

  

handleVolume: (volume) ->
  volumeIcon = switch
    when volume ==  -1 then "fa-volume-off"
    when volume ==   0 then "fa-volume-off"
    when volume <=  50 then "fa-volume-down"
    when volume <= 100 then "fa-volume-up"
  $(".volume-icon").html("<i class=\"fa #{volumeIcon}\"></i>")

style: """

  display: flex
  div
    margin: 0 4px
  .spacer
    color: #{colors.base01}
  .battery
    color: #{colors.orange}
  .time
    color: #{colors.magenta}
  .wifi
    color: #{colors.base2}
  .date
    color: #{colors.yellow}
  .cpu
    color: #{colors.cyan}
  .volume
    color: #{colors.yellow}
  .disk
    color: #{colors.green}
  
  top: 0px
  right: 0px
  margin-right: 22px
  font-family: 'SauceCodePro Nerd Font' 
  font-size: 14px
  font-smoothing: antialiasing
  box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.0)
  border-bottom-right-radius: 6px
  z-index: 0
"""
