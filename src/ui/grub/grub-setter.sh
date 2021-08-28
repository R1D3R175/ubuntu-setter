#!/bin/bash

echo "Modifying /etc/default/grub... "
sudo echo "GRUB_THEME=\"/boot/grub/themes/retro_grub/theme.txt\"" >> /etc/default/grub
sudo echo "GRUB_TIMEOUT_STYLE=menu" >> /etc/default/grub
echo "OK."

echo "Updating grub... "
sudo update-grub
echo "OK."