#!/bin/bash 
index=$1
eval $(yabai -m window --space $index && osascript -e 'tell application "Übersicht" to refresh widget id "windows-primary-jsx"')
