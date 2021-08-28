#!/bin/bash

##################################################################################################################################
echo "Downloading latest Google Chrome (stable)... "
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
echo "OK."

echo "Installing Google Chrome... "
sudo dpkg -i chrome.deb
echo "OK."
##################################################################################################################################