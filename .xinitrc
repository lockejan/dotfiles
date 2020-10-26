#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &

xset s off
xset dpms 1800 1800 0

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

session=${1:-i3}
case $session in
    i3           ) exec i3;;
    xmonad       ) exec /usr/bin/xmonad;;
esac
