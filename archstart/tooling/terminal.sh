#!/bin/bash

show_subtext "Installing terminal tools"

load_packages "./packages/terminal.conf"
yay -S --noconfirm --needed $pkg_list

if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo "Changing shell"
  chsh -s $(which zsh)
else
  echo "zsh already set"
fi

if [[ $CHEZMOI_TYPE == "desktop" ]]; then
  yay -S --noconfirm --needed \
    fastfetch `: # TUI description of the system` \ 
    ghostty `: # Terminal emulator` \
    impala  `: # Data analysis, needed?`
fi
