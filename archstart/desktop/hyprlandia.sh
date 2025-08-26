#!/bin/bash

if [[ "$CHEZMOI_TYPE" == "desktop" ]]; then

  yay -S --noconfirm --needed \
   hyprland `: # tiling window manager` \
   hyprshot `: # hyprland screenshot manager` \
   hyprpicker `: # hyprland color picker` \
   hyprlock `: # screen lock screen` \
   hypridle `: # daemon for tracking idle` \
   hyprsunset `: # blue filter` \
   polkit-gnome `: # authentication manager` \
   hyprland-qtutils `: # utils to make qt apps work with hyprland` \
   walker-bin `: # app launcer` \
   libqalculate `: # calculater` \
   waybar `: # the customizable top bar` \
   mako `: # notification daemon` \
   hyprpaper `: # wallpaper utility` \
   swayosd `: # on screen display` \
   xdg-desktop-portal-hyprland `: # desktop helpers` \
   xdg-desktop-portal-gtk `: desktop helpers `
  # install greetd
  # tuigreet
  #
  # configure those
fi
