#!/bin/bash

if [[ "$CHEZMOI_TYPE" == "desktop" ]]; then

  # Use dark mode for QT apps too (like kdenlive)
  if ! yay -Q kvantum-qt5 &>/dev/null; then
    yay -S --noconfirm kvantum-qt5
  fi
  
  # Prefer dark mode everything
  if ! yay -Q gnome-themes-extra &>/dev/null; then
    yay -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
  fi
  
  # Allow icons to match the theme
  if ! yay -Q yaru-icon-theme &>/dev/null; then
    yay -S --noconfirm yaru-icon-theme
  fi
  
  gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
  gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
  gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"
fi
