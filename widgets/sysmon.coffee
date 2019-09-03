commands =
    cpu : "ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.1f\",s/8);}'"
    mem : "ps -A -o %mem | awk '{s+=$1} END {printf(\"%.1f\",s);}' "
    hdd : "df / | awk 'END{print $5}'"
    net : "sh ./scripts/netspeed.sh"
    netid: "sh ./scripts/netid.sh"
    datetime: "sh ./scripts/datetime.sh"



command: "echo " +
         "$(#{ commands.cpu }):::" +
         "$(#{ commands.mem }):::" +
         "$(#{ commands.hdd }):::" +
         "$(#{ commands.net }):::" +
         "$(#{ commands.netid }):::" +
         "$(#{ commands.datetime }):::"

refreshFrequency: '1s'

render: ( ) ->
  """
<div class="mainbox">

    <div class="widg" id="netid">
    <div class="icon-container" id='netid-icon-container'>
        <i class="la la-wifi"></i>
    </div>
        <span class="output" id="netid-output"></span>
    </div>

    <div class="widg" id="dwl">
    <div class="icon-container" id='dwl-icon-container'>
        <i class="fas fa-download"></i>
    </div>
        <span class="output" id="dwl-output"></span>
    </div>

    <div class="widg" id="upl">
    <div class="icon-container" id='upl-icon-container'>
        <i class="fas fa-upload"></i>
    </div>
        <span class="output" id="upl-output"></span>
    </div>

    <div class="widg" id="cpu">
    <div class="icon-container" id='cpu-icon-container'>
        <i class="la la-gears"></i>
    </div>
        <span class="output" id="cpu-output"></span>
    </div>

    <div class="widg" id="mem">
    <div class="icon-container" id='mem-icon-container'>
        <i class="fas fa-memory"></i>
    </div>
        <span class="output" id="mem-output"></span>
    </div>

    <div class="widg" id="hdd">
    <div class="icon-container" id='hdd-icon-container'>
        <i class="fa fa-database"></i>
    </div>
        <span class="output" id="hdd-output"></span>
    </div>

    <div class="widg" id="datetime">
        <span class="output" id="datetime-output"></span>
    </div>
</div>

  """

convertBytes: (bytes) ->
    bits = bytes * 8
    kb = bits / 1024
    mb = kb / 1024
    if mb < 0.01
        return "0.00"
    return "#{parseFloat(mb.toFixed(2))}"

update: ( output, domEl ) ->
    output = output.split( /:::/g )

    cpu = output[ 0 ]
    mem = output[ 1 ]
    hdd = output[ 2 ]
    net = output[ 3 ].split( /@/g )
    dwl = net[ 0 ]
    upl = net[ 1 ]
    netid = output[ 4 ]
    datetime = output[ 5 ]


    $( "#cpu-output").text("#{ cpu }%")
    $( "#mem-output").text("#{ mem }%")
    $( "#hdd-output").text("#{ hdd }")
    $( "#upl-output").text("#{ @convertBytes(upl) }Mbps")
    $( "#dwl-output").text("#{ @convertBytes(dwl) }Mbps")
    $( "#netid-output").text("#{ netid }")
    $( "#datetime-output").text("#{ datetime }")


    @handleUsageColour( domEl, Number( cpu ), '#cpu' )
    @handleUsageColour( domEl, Number( mem.replace( /%/g, "") ), '#mem' )
    @handleUsageColour( domEl, Number( hdd.replace( /%/g, "") ), '#hdd' )
    @handleUpDownColour( domEl, Number( @convertBytes(upl) ) , '#upl')
    @handleUpDownColour( domEl, Number( @convertBytes(dwl) ) , '#dwl')
    @handleConnColour( domEl, netid, '#netid' )


# change colour classes based on value

handleUsageColour: ( domEl, monval, monid ) ->
    div = $(domEl)

    div.find(monid).removeClass('blue')
    div.find(monid).removeClass('yellow')
    div.find(monid).removeClass('red')

    if monval < 50
        div.find(monid).addClass('blue')
    else if monval < 80
        div.find(monid).addClass('yellow')
    else
        div.find(monid).addClass('red')

handleUpDownColour: ( domEl, speed, monid) ->
    div = $(domEl)

    div.find(monid).removeClass('blue')
    div.find(monid).removeClass('red')

    if speed < 1
        div.find(monid).addClass('blue')
    else
        div.find(monid).addClass('red')

handleConnColour: ( domEl, connStat, monid ) ->
    div = $(domEl)

    div.find(monid).removeClass('green')
    div.find(monid).removeClass('red')

    if connStat == 'Not Connected'
        div.find(monid).addClass('red')
    else
        div.find(monid).addClass('green')


style: """

    -webkit-backdrop-filter: blur(20px)
    border-radius: 0px
    border: 0px solid #fff
    color: #fff
    background-color: #272C34
    font-family: Roboto
    font-size: 12px
    max-height: 30px
    padding: 0em 0.5em 0.1em 0.5em

    position: fixed
    left: 80%
    transform translateX(-50%)
    top: 1%


    .mainbox
        display: flex
        flex-direction: row
        justify-content: center
        align-items: center
        padding: 0.2em
        border: 0px solid #fff
        max-height: 26px

    .widg
        display: flex
        flex-direction: row
        justify-content: center
        align-items: center
        margin: 0.6em

    .icon-container
        margin-right: 0.4em

    .output
        color: #f2f2f2
        white-space: nowrap

    .la
        font-size: 1.8em
    .fa
        font-size: 1.2em
        font-weight: lighter

    .blue
        color: #73AEEA
    .green
        color: #A1C181
    .yellow
        color: #E0C085
    .red
        color: #B2564B

"""
