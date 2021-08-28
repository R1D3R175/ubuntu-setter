#!/bin/bash

##################################################################################################################################
echo "Downloading discord..."
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
echo "OK."

echo "Installing discord..."
sudo dpkg -i discord.deb
echo "OK."
##################################################################################################################################