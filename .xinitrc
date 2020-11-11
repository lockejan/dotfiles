#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &
dunst &
picom &
gammastep &
autorandr --change
# fusuma &
gnome-pomodoro --no-default-window &
i3-gnome-pomodoro daemon &
amixer set Capture -q 55%
disable-dpms &
xsetroot -cursor_name left_ptr

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

session=${1:-xmonad}
case $session in
    i3           ) exec i3;;
    bspwm        ) exec bspwm;;
    xmonad       ) exec /usr/bin/xmonad;;
esac
