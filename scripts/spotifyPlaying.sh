#!/bin/bash
set -e
osascript - <<EOF
tell application "System Events"
    set processList to (name of every process)
end tell
if (processList contains "Spotify") is true then
    tell application "Spotify"
        if player state is playing then
            set artistName to artist of current track
            set trackName to name of current track
            return artistName & " - " & trackName
        else
            return ""
        end if
    end tell
end if

