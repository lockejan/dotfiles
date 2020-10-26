#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &
# xset r rate 300 50 &
dunst &
picom &
redshift &
autorandr --change
fusuma &
gnome-pomodoro --no-default-window &
i3-gnome-pomodoro daemon &
amixer set Caputer -q 55%

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

session=${1:-i3}
case $session in
    i3           ) exec i3;;
    xmonad       ) exec /usr/bin/xmonad;;
esac
