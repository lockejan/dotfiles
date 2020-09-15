#!/usr/bin/env bash

i3status | while :
do
  read line
  pomodoro=`python ~/bin/i3-gnome-pomodoro/pomodoro-client.py status`
  version=$(python --version | awk '{print $2}')
  echo " $version | $pomodoro| $line" || exit 1
done

