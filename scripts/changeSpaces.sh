#!/bin/bash
index=$1; 
display=$(yabai -m query --displays | jq --argjson index "${index}" -r 'map(select(.spaces[] | contains($index))) | .[] .index');
eval "$(yabai -m display --focus ${display} && yabai -m query --spaces | jq --argjson index "${index}" -r '(.[] | select(.index == $index).windows[0]) as $wid | if $wid then "yabai -m window --focus \"" + ($wid | tostring) + "\"" else "skhd --key \"ctrl - " + (map(select(."native-fullscreen" == 0)) | index(map(select(.index == $index))) + 1 % 10 | tostring) + "\"" end')"
