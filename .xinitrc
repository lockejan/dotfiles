#!/bin/sh
[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

setxkbmap de
setxkbmap -option caps:escape
numlockx &

xset s off
xset dpms 1800 1800 0

exec i3
