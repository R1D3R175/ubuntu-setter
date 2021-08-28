#!/bin/bash

echo "Gathering Themes... "
wget -O Nordic_Wallpaper.jpg https://i.imgur.com/SBKjnxm.jpeg
wget -O Nordic-darker.tar.xz https://github.com/EliverLara/Nordic/releases/download/2.0.0/Nordic-darker.tar.xz
git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
cd papirus-icon-theme
cp Papirus-Dark $HOME/tmp/themes
cd $HOME/tmp/themes
rm -rf papirus-icon-theme
echo "OK."

echo "Extracting Themes... "
tar -xf Nordic-darker.tar.xz
echo "OK."

echo "Moving Themes... "
sudo mkdir -p /usr/share/themes
sudo mkdir -p /usr/share/icons

mv Papirus-Dark Nordic-dark

sudo mv Nordic-darker /usr/share/themes
sudo mv Nordic-dark /usr/share/icons
echo "OK."