#!/bin/bash

PATH=/usr/local/bin/:$PATH

APPS=$(python2.7 '/Users/js/Library/Application Support/Übersicht/widgets/scripts/spaces.py')

echo $(cat <<-EOF
[
    $APPS
]
EOF
)
