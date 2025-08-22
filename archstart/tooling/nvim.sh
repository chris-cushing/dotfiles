#!/bin/bash

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed \
    nvim \            # The best text editor
    luarocks \        # Lua package manager
    tree-sitter-cli   # Builds syntax trees
fi
