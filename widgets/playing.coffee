# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "./scripts/playing.sh"

# the refresh frequency in milliseconds
refreshFrequency: 2500

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
    <i class="fab fa-spotify"></i>
    <p>#{output}</p>



"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """

    -webkit-backdrop-filter: blur(20px)
    border-radius: 0px
    border: 0px solid #fff
    color: #fff
    background-color: #272C34
    font-family: Roboto
    font-size: 12px

    height: 30px
    padding: .1em 0.6em 0.1em 0.6em

    display: flex
    flex-direction: row
    justify-content: center
    align-items: center

    left: 50%
    transform translateX(-50%)
    top: 1%

    i
        margin-right: 0.6em
        color: #57B560

"""
