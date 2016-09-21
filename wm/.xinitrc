#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap


if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ "$HOSTNAME" = arch ]; then
    xrandr --output DVI-0 --auto --right-of VGA-0
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi



exec i3
