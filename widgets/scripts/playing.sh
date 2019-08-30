#!/bin/bash


song="$(osascript -e 'tell application "Spotify" to artist of current track as¬
                                          string & "\n" & album of current track as¬
                                          string & "\n" & name of current track as string')"
IFS=$'\n' read -d "" -r artist album title <<< "${song//'\n'/$'\n'}"


echo "$artist - $title"
