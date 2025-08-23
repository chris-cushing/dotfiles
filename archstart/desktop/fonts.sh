#!/bin/bash

if [[ "$CHEZMOI_TYPE" == "desktop" ]]; then

  yay -S --noconfirm --needed \
    ttf-font-awesome \
    ttf-cascadia-mono-nerd \
    ttf-ia-writer \
    noto-fonts \
    noto-fonts-emoji \
    ttf-hack-nerd \
    ttf-jetbrains-mono \
    noto-fonts-cjk \
    noto-fonts-extra
fi
