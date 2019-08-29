#!/bin/bash
set -e
osascript - <<EOF
tell application "Google Chrome"
    make new window
    activate
end tell
EOF
