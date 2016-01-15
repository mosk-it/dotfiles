#!/bin/sh
#
# ~/.xinitrc


ifjk


if [ "$HOST" = arch ]; then
    xrandr --output DVI-0 --auto --right-of VGA-0 &
else
    xrandr --output DVI-0 --auto --right-of VGA-0 &
fi

numlockx on &
setxkbmap -option caps:escape &
xmodmap -e 'pointer = 1 2 3 4 5 6 7 9 8 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24' &

xautolock -time 10 -locker autolock -nowlocker autolock -detectsleep -corners 000+ -cornerdelay 3 &
feh --bg-fill bblack-pattern-wallpaper.jpg &

exec i3 

