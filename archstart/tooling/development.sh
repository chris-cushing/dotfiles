#!/bin/bash

yay -S --noconfirm --needed \
  cargo `: # rust package manager and tooling` \          
  clang `: # alternative c (and others) compiler suite` \          
  llvm `: # compiler and toolchain` \           
  github-cli `: # cli for github.com` \     
  lazygit `: # nice tui front end for git` \        
  lazydocker-bin `: # nice tui for docker`

if [[ "$CHEZMOI_TYPE" == "desktop"]]; then
  yay -S --noconfirm --needed \
    imagemagick  # cli image manipulation
fi
