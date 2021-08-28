#!/bin/bash

echo "Enabling Clipboard Indicator... "
gnome-extensions enable clipboard-indicator@tudmotu.com
echo "OK."

echo "Disabling Ubuntu-Dock... "
gnome-extensions enable ubuntu-dock@ubuntu.com
echo "OK."

echo "Enabling Floating Dock... "
gnome-extensions enable floating-dock@nandoferreira_prof@hotmail.com
echo "OK."

echo "Changing dock position to bottom... "
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
echo "OK."