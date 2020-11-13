if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && [[ $(tty) =  /dev/tty1 ]]; then
    # exec startx -- -keeptty &> ~/.xorg.log
    exec startx ~/.xinitrc
elif [[ $(tty) = /dev/tty2 ]]; then
    exec sway --my-next-gpu-wont-be-nvidia
elif [[ $(tty) = /dev/tty3 ]]; then
    exec startx ~/.xinitrc xmonad
fi
