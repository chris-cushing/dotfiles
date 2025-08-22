#!/bin/bash

if [[ "$CHEZMOI_TYPE" == "desktop"]]; then
  yay -S --noconfirm --needed \
  brightnessctl \       # control screen brightness from cli
  playerctl \           # cli tool to control media players that support MPRIS
  pamixer \             # pulse audio cli mixer
  wiremix \             # pipewire tui mixer
  wireplumber \         # session and policy manager for pipwire
  fcitx5 \              # input method framework #TODO Do I need this?
  fcitx5-gtk \          # input method framework #TODO Do I need this?
  fcitx5-qt \           # input method framework #TODO Do I need this?
  wl-clip-persist \     # make the clipboard persist after source app closes
  nautilus \            # gui file manager from gnome
  sushi \               # file previewers for nautilus
  ffmpegthumbnailer \   # thumbnails for mpegs
  gvfs-mtp \            # tool for transfering media off of android
  slurp \               # utility for wayland for cli selection of regions
  satty \               # a screen shot annotation tool
  mpv \                 # cli media player
  evince \              # gnome based document viewer
  imv \                 # wayland image viwer
  zen-browser-bin       # fork of the firefox web browser

  # Add screen recorder based on GPU
  if lspci | grep -qi 'nvidia'; then
    yay -S --noconfirm --needed wf-recorder
  else
    yay -S --noconfirm --needed wl-screenrec
  fi
fi
