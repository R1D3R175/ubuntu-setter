#!/bin/bash

echo "Installing git... "
sudo apt install git
echo "OK."

echo "Installing some libs... "
sudo apt install libappindicator1 libc++1 libglib2.0-bin
echo "OK."

echo "Installing cURL... "
sudo apt install curl
echo "OK."

echo "Installing Rust... "
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "OK."

echo "Installing MSR-Tools... "
sudo apt install msr-tools
echo "OK."

echo "Installing Wget... "
sudo apt install wget
echo "OK."

echo "Installing Make... "
sudo apt install make
echo "OK."

echo "Installing Snap... "
sudo apt install snapd
echo "OK."

echo "Installing Tar... "
sudo apt install tar
echo "OK."

echo "Installing gnome-shell-extensions... "
sudo apt install gnome-shell-extensions
echo "OK."