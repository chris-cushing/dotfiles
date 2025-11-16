#!/usr/bin/env bash

# ------------------------------------------------------------------
# parse_config_file <path>
#
#   Reads <path> line‑by‑line, discards blank lines and comments,
#   and strips inline comments (anything after the first ‘#’).
#
#   Globals set:
#       pkg_list  – array containing the parsed strings
#
#   Returns:
#       0 on success, non‑zero on error
# ------------------------------------------------------------------
parse_config_file() {
    local file=$1
    [[ -z $file ]] && { echo "Error: no file supplied" >&2; return 1; }
    [[ ! -r $file ]] && { echo "Error: cannot read '$file'" >&2; return 1; }

    pkg_list=()                     # reset output array

    while IFS= read -r line || [[ -n $line ]]; do
        # ------------------------------------------------------------
        # 1️⃣ Remove the comment portion (everything from the first #)
        # ------------------------------------------------------------
        #   ${var%%#*}  → shortest suffix removal, i.e. keep everything
        #                before the first '#'.  If there is no '#',
        #                the whole line is kept unchanged.
        line=${line%%#*}

        # ------------------------------------------------------------
        # 2️⃣ Trim leading / trailing whitespace *only for the test*
        # ------------------------------------------------------------
        local trimmed=${line#"${line%%[![:space:]]*}"}   # left trim
        trimmed=${trimmed%"${trimmed##*[![:space:]]}"}   # right trim

        # ------------------------------------------------------------
        # 3️⃣ Skip if nothing remains after comment removal
        # ------------------------------------------------------------
        [[ -z $trimmed ]] && continue

        # ------------------------------------------------------------
        # 4️⃣ Store the original (still‑trimmed) line in the array
        # ------------------------------------------------------------
        pkg_list+=("$trimmed")
    done < "$file"

    return 0
}
