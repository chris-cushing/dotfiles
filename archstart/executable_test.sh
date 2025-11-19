#!/usr/bin/env bash

source load_config.sh

load_packages "./packages/desktop.conf"
echo $pkg_list 

pacman -S --noconfirm --needed $pkg_list
