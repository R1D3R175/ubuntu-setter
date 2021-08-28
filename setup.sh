#!/bin/bash

working=$(pwd)

mkdir -p "$HOME/tmp"
cd "$HOME/tmp"

echo "|**************************|"
echo "|DEPENDENCIES SETUP STARTED|"
echo "|**************************|"

"$working/src/dependencies.sh"

echo "|***************************|"
echo "|DEPENDENCIES SETUP FINISHED|"
echo "|***************************|"



echo "|**********************|"
echo "|RC-LOCAL SETUP STARTED|"
echo "|**********************|"

"$working/src/rc-local.sh"

echo "|***********************|"
echo "|RC-LOCAL SETUP FINISHED|"
echo "|***********************|"




echo "|*****************************|"
echo "|SPOTIFY-ADBLOCK SETUP STARTED|"
echo "|*****************************|"

mkdir -p spotify-adblock
cd spotify-adblock

"$working/src/spotify-adblock.sh"

cd $HOME/tmp
rm -rf spotify-adblock

echo "|******************************|"
echo "|SPOTIFY-ADBLOCK SETUP FINISHED|"
echo "|******************************|"



echo "|*********************|"
echo "|DISCORD SETUP STARTED|"
echo "|*********************|"

mkdir -p discord
cd discord

"$working/src/discord.sh"

cd $HOME/tmp
rm -rf discord

echo "|**********************|"
echo "|DISCORD SETUP FINISHED|"
echo "|**********************|"


echo "|********************|"
echo "|PREMID SETUP STARTED|"
echo "|********************|"

mkdir -p premid
cd premid

"$working/src/premid.sh"

cd $HOME/tmp
rm -rf premid

echo "|*********************|"
echo "|PREMID SETUP FINISHED|"
echo "|*********************|"



echo "|*********************|"
echo "|VS-CODE SETUP STARTED|"
echo "|*********************|"

"$working/src/code.sh"

echo "|**********************|"
echo "|VS-CODE SETUP FINISHED|"
echo "|**********************|"



echo "|***************************|"
echo "|PULSE-EFFECTS SETUP STARTED|"
echo "|***************************|"

"$working/src/pulseeffects.sh"

echo "|****************************|"
echo "|PULSE-EFFECTS SETUP FINISHED|"
echo "|****************************|"



echo "|**************************|"
echo "|PAVU-CONTROL SETUP STARTED|"
echo "|**************************|"

"$working/src/pavucontrol.sh"

echo "|***************************|"
echo "|PAVU-CONTROL SETUP FINISHED|"
echo "|***************************|"



echo "|**********************|"
echo "|NEOFETCH SETUP STARTED|"
echo "|**********************|"

"$working/src/neofetch.sh"

echo "|********************|"
echo "|CHROME SETUP STARTED|"
echo "|********************|"

mkdir -p chrome
cd chrome

"$working/src/chrome.sh"

cd $HOME/tmp
rm -rf chrome

echo "|*********************|"
echo "|CHROME SETUP FINISHED|"
echo "|*********************|"



echo "|*******************|"
echo "|AUTHY SETUP STARTED|"
echo "|*******************|"

"$working/src/authy.sh"

echo "|********************|"
echo "|AUTHY SETUP FINISHED|"
echo "|********************|"



echo "|********************|"
echo "|LUTRIS SETUP STARTED|"
echo "|********************|"

"$working/src/lutris.sh"

echo "|*********************|"
echo "|LUTRIS SETUP FINISHED|"
echo "|*********************|"



echo "|*******************|"
echo "|THEME SETUP STARTED|"
echo "|*******************|"

mkdir -p themes
cd themes

"$working/src/ui/theme/theme-downloader.sh"

"$working/src/ui/theme/theme-setter.sh"

"$working/src/ui/ext/ext-downloader.sh"

"$working/src/ui/ext/ext-setter.sh"

cd $HOME/tmp

echo "|********************|"
echo "|THEME SETUP FINISHED|"
echo "|********************|"



echo "|************************|"
echo "|GRUB-THEME SETUP STARTED|"
echo "|************************|"

cd themes

"$working/src/ui/grub/grub-downloader.sh"

"$working/src/ui/grub/grub-setter.sh"

cd $HOME/tmp

rm -rf themes

echo "|*************************|"
echo "|GRUB-THEME SETUP FINISHED|"
echo "|*************************|"