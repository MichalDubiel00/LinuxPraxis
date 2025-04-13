#!/bin/bash

KEYS_DIR="./keydir"

usernames=""

for file in "$KEYS_DIR"/*.pub; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        username="${filename%.pub}"

        usernames+="$username, "
    fi
done

echo "$usernames"
