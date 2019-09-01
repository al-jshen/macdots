# the refresh frequency in milliseconds
refreshFrequency: false

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
    <div></div>
"""

style: """

    -webkit-backdrop-filter: blur(20px)
    border-radius: 0px
    border: 0px solid #fff
    color: #fff
    background-color: #272C34
    font-size: 12px

    height: 30px
    left: 0%
    top: 1%
    width: 100%
    padding: .1em 0.6em 0.1em 0.6em
    z-index: -1


"""
