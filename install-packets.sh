#!/bin/bash

# prerequisites: you installed these packages:
# base base-devel linux linux-firmware linux-headers efibootmgr refind networkmanager
# optional: wireguard-tools openresolv ueberzug

sudo pacman -Syyu
sudo pacman -S xorg xorg-init git ueberzug nvidia dwm picom alacritty feh nitrogen rofi neofetch htop ttf-jetbrains-mono ttf-font-awesome
fc-cache -fv

# TODO: full installation script
