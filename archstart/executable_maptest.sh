#!/usr/bin/env bash

install_packages() {
    local CONFIG_FILE=$1
    mapfile -t packages < <(
        sed -e 's/#.*//' \
          -e 's/^[[:space:]]*//' \
           -e 's/[[:space:]]*$//' \
            "$CONFIG_FILE" |
        grep -v '^$'              # ← grep with the -v flag removes blank lines
    )
    yay -S "${packages[@]}"
}

