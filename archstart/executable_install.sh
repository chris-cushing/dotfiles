#!/bin/bash

ansi_art='
╔──────────────────────────────────────────────────────────────────────────╗
│ █████╗ ██████╗  ██████╗██╗  ██╗███████╗████████╗ █████╗ ██████╗ ████████╗│
│██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝│
│███████║██████╔╝██║     ███████║███████╗   ██║   ███████║██████╔╝   ██║   │
│██╔══██║██╔══██╗██║     ██╔══██║╚════██║   ██║   ██╔══██║██╔══██╗   ██║   │
│██║  ██║██║  ██║╚██████╗██║  ██║███████║   ██║   ██║  ██║██║  ██║   ██║   │
│╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   │
╚──────────────────────────────────────────────────────────────────────────╝
'

clear
echo -e "\n$ansi_art\n"


set -e

catch_errors() {
  echo -e "\n\e[31mArchstart installation failed!\e[0m"
}

trap catch_errors ERR

# show_logo() {
#   # clear
#   tte -i ./logo.txt --frame-rate ${2:-120} ${1:-expand}
#   echo
# }

show_subtext() {
  # echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo "$1"
  echo
}

source ./load_config.sh
# Install prerequisites
sudo pacman -Sy --noconfirm --needed git
sudo pacman -Sy --noconfirm --needed chezmoi
sudo pacman -Sy --noconfirm --needed gum

SYSTEM_TYPE=$(gum choose "server" "desktop")
# Write these values to ~/.config/chezmoi/chezmoi.toml
# and pray that they will be recognized by...

# is this a problem to re-init?
chezmoi init chris-cushing

source ./preflight/guard.sh
source ./preflight/aur.sh
source ./preflight/presentation.sh

# Tooling
# show_logo decrypt 920
show_subtext "Installing terminal tools"
source ./tooling/terminal.sh
source ./tooling/nvim.sh

# Desktop
# show_logo slice 60
if [[ "$SYSTEM_TYPE" == "desktop" ]]; then
  show_subtext "Desktop Selected"
  source ./desktop/desktop.sh
fi

# Updates
# show_logo highlight
show_subtext "Updating system packages"

if [[ "$SYSTEM_TYPE" == "desktop" ]]; then
  yay -Syu --noconfirm --ignore uwsm
fi

# Reboot
# show_logo laseretch 920
show_subtext "You're done! I could reboot, but I'm going to let you do it..."
sleep 2

