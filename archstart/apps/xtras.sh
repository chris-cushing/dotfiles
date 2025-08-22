#!/bin/bash

if [[ "$CHEZMOI_TYPE" == "desktop"]]; then

  yay -S --noconfirm --needed \
    gnome-calculator \  # gui calculator
    gnome-keyring  \    # keyring utility
    obsidian \          # note taking app and so much more
    libreoffice         # MS Office replacement
  
  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in \
    pinta \   # simple image editor
    typora \  # Markdown reader
    spotify \ # music playing service
    ; do
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done
  yay -S --noconfirm --needed bitwarden # password manager of choise 
    echo -e "\e[31mFailed to install bit warden. Continuing without!\e[0m"
fi

yay -S --noconfirm --needed bitwarden-cli # cli interface for bitwarden
