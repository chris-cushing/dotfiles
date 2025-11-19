#!/usr/bin/env bash

source parse_config.sh

#!/usr/bin/env bash

config_path="./packages/desktop.conf"
if parse_config_file "$config_path"; then
    printf 'Parsed %d entries:\n' "${#cfg_lines[@]}"
    for entry in "${pkg_list[@]}"; do
        printf '  • %s\n' "$entry"
    done
    yay -S  "${pkg_list[@]}"
else
    echo "Failed to read config."
fi
