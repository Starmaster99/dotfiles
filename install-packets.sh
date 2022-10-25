#!/bin/bash

# prerequisites: you installed these packages:
# base base-devel linux linux-firmware linux-lts linux-headers efibootmgr refind networkmanager
# optional: wireguard-tools openresolv ueberzug

sudo pacman -Syyu
sudo pacman -S xorg xorg-init git ueberzug nvidia dwm picom alacritty feh nitrogen rofi neofetch htop ttf-jetbrains-mono ttf-font-awesome
fc-cache -fv

# install `yay`?
# https://github.com/Jguer/yay

# TODO: full installation script
