#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &
dunst &
picom --xrender-sync-fence &
gammastep &
autorandr --change
# fusuma &
gnome-pomodoro --no-default-window &
i3-gnome-pomodoro daemon &
amixer set Capture -q 55%
disable-dpms &
xsetroot -cursor_name left_ptr
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
# systemctl --user import-environment PATH DBUS_SESSION_BUS_ADDRESS
# systemctl --no-block --user start xsession.target

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

session=${1:-i3}
case $session in
    i3           ) exec i3;;
    xmonad       ) exec /usr/bin/xmonad;;
    gnome        ) exec gnome-session;;
esac
