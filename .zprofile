if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && [[ $(tty) =  /dev/tty1 ]]; then
    # exec startx -- -keeptty &> ~/.xorg.log
    exec startx ~/.xinitrc
elif [[ $(tty) = /dev/tty2 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 2 ]; then
        exec sway --my-next-gpu-wont-be-nvidia
    fi
fi
