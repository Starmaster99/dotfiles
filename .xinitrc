#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# This is my window size. Type 'xrandr' to see all available resolutions. 
xrandr -s 1920x1080

# Restore wallpaper
nitrogen --restore &

setxkbmap -layout us,ru -option grp:win_space_toggle

# I am testing my Arch build on VirtualBox and picom doesn't work without
# these parameters. I think it will work perfectly fine without
# them on your desktop device. As always, feel free to experiment :)
picom --no-vsync --no-use-damage --config ~/.config/picom/picom.conf &

# Restarting WM with (default dwm hotkey layout) mod+shift+q
while true; do
	dwm >/dev/null 2>&1
	# Crude, but it works; still looking for a better solution.
	killall dwmbar
	dwmbar &
done

exec dwm

