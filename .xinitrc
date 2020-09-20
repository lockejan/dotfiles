#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap de
setxkbmap -option caps:escape
numlockx &

xset s off
xset dpms 1800 1800 0

exec i3
