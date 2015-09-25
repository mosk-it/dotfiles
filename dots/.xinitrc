#!/bin/sh
#
# ~/.xinitrc


if [ -f ~/.env ]; then
    source ~/.env &&
    cat ~/.i3/config.template | perl -p -e 's/\$\(([^}]+)\)/defined $ENV{$1} ? $ENV{$1} : $&/eg'  > ~/.i3/config &&
    xrandr --output $OUTPUT2 --auto --right-of $OUTPUT1 &
fi


numlockx on &
setxkbmap -option caps:escape &
xmodmap -e 'pointer = 1 2 3 4 5 6 7 9 8 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24' &

exec i3 
