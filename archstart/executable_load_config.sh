#!/usr/bin/env bash

load_packages() {
    local CONFIG_FILE=$1
    pkg_list=()
    mapfile -t packages < <(
        sed -e 's/#.*//' \
          -e 's/^[[:space:]]*//' \
           -e 's/[[:space:]]*$//' \
            "$CONFIG_FILE" |
        grep -v '^$'              # ← grep with the -v flag removes blank lines
    )
    pkg_list="${packages[@]}"
}

