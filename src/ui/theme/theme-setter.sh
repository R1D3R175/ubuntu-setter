#!/bin/bash

echo "Setting Lock Screen Image... "
"$working/src/ui/focalgdm3.sh $HOME/tmp/themes/Nordic_Wallpaper.jpg"
echo "OK."

echo "Setting Desktop Wallpaper... "
"cp Nordic_Wallpaper.jpg  $HOME/.local/share/backgrounds"
gsettings set org.gnome.desktop.background Nordic_Wallpaper.jpg
echo "OK."

echo "Setting Themes... "
gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
gsettings set org.gnome.desktop.interface icon-theme 'Nordic-dark'
echo "OK."