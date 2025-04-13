#!/bin/bash

KEYS_DIR="./keydir"

CONFIG_FILE="example.conf"

usernames=""

for file in "$KEYS_DIR"/*.pub; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        username="${filename%.pub}"

        usernames+="$username, "
    fi
done

sed -i "s/@demo_project_users =.*/@demo_project_users = $usernames/" "$CONFIG_FILE"
