#!/bin/bash

PATH=/usr/local/bin/:$PATH

# Check if chunkc exists
if ! [ -x "$(command -v yabai)" ]; then
  echo "{\"error\":\"yabai binary not found\"}"
  exit 1
fi

#APPS=$(yabai -m query --windows | grep "\"app\"" | sed 's/\"app\":\"//' | sed 's/\"//')
#APPS=$(yabai -m query --windows)
#ACTIVE=$(yabai -m query --windows --window)
APPS=$(python2 /Users/js/Library/Application\ Support/Übersicht/widgets/nibar/scripts/spaces.py)


echo $(cat <<-EOF
[
    $APPS
]
EOF
)
