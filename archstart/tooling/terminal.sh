#!/bin/bash

load_packages "./packages/terminal.conf"
yay -S --noconfirm --needed $pkg_list

if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo "Changing shell"
  chsh -s $(which zsh)
else
  echo "zsh already set"
fi

