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

redshift &
xrandr --output DP-4 --off --output DP-5 --mode 2560x1440 --pos 0x1001 --rotate normal --output DP-6 --mode 2560x1440 --pos 2560x0 --rotate left --output HDMI-2 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-1 --off
exec awesome 
# script stops at first `exec`
