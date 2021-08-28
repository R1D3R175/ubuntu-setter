home=$HOME

echo "|******************************|"
echo "|OPENFREEZECENTER SETUP STARTED|"
echo "|******************************|"

cd $home/tmp

mkdir -p ofc
cd ofc

##################################################################################################################################
echo "Downloading OpenFreezeCenter... "
git clone https://github.com/YoCodingMonster/OpenFreezeCenter.git
echo "OK."

echo "Moving to /opt..."
sudo mv OpenFreezeCenter /opt
echo "OK."

echo "Creating script \"ofc.sh\" for running OpenFreezeCenter at $home/scripts..."
mkdir -p $home/scripts

echo "
#!/bin/bash

cd /opt/OpenFreezeCenter && ./at_startup.sh
" > $home/scripts/ofc.sh

echo "OK."
##################################################################################################################################

cd $home/tmp

echo "|*******************************|"
echo "|OPENFREEZECENTER SETUP FINISHED|"
echo "|*******************************|"