if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  # exec startx -- -keeptty &> ~/.xorg.log
  exec ssh-agent startx
fi
