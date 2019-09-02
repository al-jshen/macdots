#!/bin/bash

PATH=/usr/local/bin/:$PATH

APPS=$(python2.7 '/Users/js/Library/Application Support/Übersicht/widgets/scripts/newspaces.py')

echo $(cat <<-EOF
[
    $APPS
]
EOF
)
