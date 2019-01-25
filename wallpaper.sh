#!/bin/bash

set -eou pipefail

WALLCONF=~/.config/wallpapers

# Check arguments
if [ "$#" -lt 1 ]; then
  NEW=$(grep 'CURRENT' $WALLCONF | sed 's/CURRENT//')
elif [ "$1" == "p" ]; then
  NEW=$(grep -B 1 'CURRENT' $WALLCONF | head -n1)
elif [ "$1" == "n" ]; then
  NEW=$(grep -A 1 'CURRENT' $WALLCONF | tail -n1)
fi

sed -i 's/CURRENT//' $WALLCONF
sed -i 's@'"$NEW"'@'"$NEW"'CURRENT@' $WALLCONF

notify-send -t 5000 -i /usr/share/wallpapers/\""$NEW"\" "Changing wallpaper" "Changing wallpaper to $NEW"

swaymsg output '*' bg /usr/share/wallpapers/\""$NEW"\" fill
