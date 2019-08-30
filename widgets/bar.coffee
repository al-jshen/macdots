# This is a simple example Widget, written in CoffeeScript, to get you started
# with Übersicht. For the full documentation please visit:
#
# https://github.com/felixhageloh/uebersicht
#
# You can modify this widget as you see fit, or simply delete this file to
# remove it.

# this is the shell command that gets executed every time this widget refreshes
command: "whoami"

# the refresh frequency in milliseconds
refreshFrequency: 1000000

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
  <h1>Hi, #{output}</h1>
  <i class="fab fa-memory"></i>
"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """

  -webkit-backdrop-filter: blur(20px)
  border-radius: 5px
  border: 2px solid #fff
  color: #141f33
  font-family: Helvetica Neue
  font-weight: 300
  left: 3.5%
  padding: 5px
  top: 1%
  width: 90%

  h1
    font-size: 20px
    font-weight: 300
    margin: 16px 0 8px

  em
    font-weight: 400
    font-style: normal
"""
