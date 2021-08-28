#!/bin/bash

##################################################################################################################################
echo "Adding Spotify Debian repository... "
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
echo "OK."

echo "Updating and downloading spotify-client... "
sudo apt-get update && sudo apt-get install spotify-client
echo "OK."

echo "Downloading Spotify-adblock and building package... "
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
echo "OK."

echo "Installing package... "
sudo make install
echo "OK."

echo "Creating shortcut... "
cd $HOME/.local/share/applications
echo "
[Desktop Entry]
Type=Application
Name=Spotify (adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
" > spotify-adblock.desktop
echo "OK."
##################################################################################################################################