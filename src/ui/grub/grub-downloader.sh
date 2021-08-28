#!/bin/bash

echo "Downloading Retro-Grub... "
git clone https://gitlab.com/deck451/retro_grub_grub_theme.git retro_grub_theme
echo "OK."

cd retro_grub_theme

echo "Moving retro-grub to grub themes folder... "
sudo mkdir -p /boot/grub/themes
sudo mv retro_grub /boot/grub/themes
echo "OK."