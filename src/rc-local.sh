#!/bin/bash

##################################################################################################################################
echo "Creating rc-local.service... "
echo "
[Unit]
 Description=/etc/rc.local Compatibility
 ConditionPathExists=/etc/rc.local

[Service]
 Type=forking
 ExecStart=/etc/rc.local start
 TimeoutSec=0
 StandardOutput=tty
 RemainAfterExit=yes
 SysVStartPriority=99

[Install]
 WantedBy=multi-user.target
" | sudo tee -a /etc/systemd/system/rc-local.service
echo "OK."

echo "Creating turbo_enable.sh script in $HOME/scripts... "
echo "
#!/bin/bash

cores=$(cat /proc/cpuinfo | grep processor | awk '{print $3}')
for core in $cores; do
       sudo wrmsr -p${core} 0x1a0 0x850089
done
" > $HOME/scripts/turbo_enable.sh
echo "OK."

echo "Creating turbo_disable.sh script in $HOME/scripts... "
echo "
#!/bin/bash

cores=$(cat /proc/cpuinfo | grep processor | awk '{print $3}')
for core in $cores; do
        sudo wrmsr -p${core} 0x1a0 0x4000850089
done
" > $HOME/scripts/turbo_disable.sh
echo "OK."

echo "Adding startup scripts to /etc/rc.local... "
echo "
#!/bin/bash

wrmsr 0x1ad 0x2525252525252525 

$HOME/scripts/turbo_enable.sh
" | sudo tee -a /etc/rc.local
echo "OK."

echo -n "Making /etc/rc.local executable... "
sudo chmod +x /etc/rc.local
echo "OK."

echo -n "Enabling rc-local... "
sudo systemctl enable rc-local
echo "OK."

echo -n "Starting rc-local.service... "
sudo systemctl start rc-local.service
echo "OK."
##################################################################################################################################