#!/bin/sh

PATH=/usr/local/bin/:$PATH

# Check if yabai exists
if ! [ -x "$(command -v yabai)" ]; then
  echo "{\"error\":\"yabai binary not found\"}"
  exit 1
fi

SPACES=$(yabai -m query --spaces --display 1)
ACTIVE=$(yabai -m query --spaces --space | jq .index)
# APP_NAME=$(yabai -m query --windows --window | jq .app)
# TYPE=$(yabai -m query --spaces --space | jq .type)

echo $(cat <<-EOF
{
	"desktop": {
        "spaces": $SPACES,
        "active": $ACTIVE
	}
}
EOF
)
