#!/bin/bash

yay -S --noconfirm --needed \
  gnome-calculator gnome-keyring  \
  obsidian libreoffice  

# Packages known to be flaky or having key signing issues are run one-by-one
for pkg in pinta typora spotify ; do
  yay -S --noconfirm --needed "$pkg" ||
    echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
done
yay -S --noconfirm --needed bitwarden bitwarden-cli ||
  echo -e "\e[31mFailed to install bit warden. Continuing without!\e[0m"
