#!/usr/bin/env bash

# prerequisites: you installed these packages:
# base base-devel linux linux-firmware linux-headers efibootmgr refind networkmanager git
# optional: wireguard-tools openresolv

read -p "Do you use NVIDIA videocard? (y/n) " has_nvidia
read -p "Do you want to install and use bspwm? (y/n)" wm

sudo pacman --noconfirm -Syu xorg xorg-init ueberzug picom alacritty feh nitrogen rofi neofetch htop flameshot ttf-jetbrains-mono ttf-font-awesome
fc-cache -fv

if [[ $has_nvidia == [yY] ]]
then
	sudo pacman -S --noconfirm nvidia
else
	sudo pacman -S --noconfirm mesa libva-mesa-driver mesa-vdpau xf86-video-amdgpu vulkan-radeon 
fi

if [[ $wm == [yY] ]]
then
	sudo pacman -S --noconfirm bspwm sxhkd polybar
else
	cd dwm-pack/dwm && sudo make clean install
	echo "Your dwm config files are now in .dotfiles/dwm-pack/dwm."
fi
