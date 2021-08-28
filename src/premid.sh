#!/bin/bash

##################################################################################################################################
echo "Downloading PreMiD script... "
curl -s https://packagecloud.io/install/repositories/PreMiD/Linux/script.deb.sh | sudo bash
echo "OK."

echo "Installing PreMiD... "
sudo apt install premid
echo "OK."
##################################################################################################################################