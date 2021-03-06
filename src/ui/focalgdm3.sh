#!/bin/bash

# StackOverflow question that gave the script:
# https://askubuntu.com/questions/1359963/how-do-you-change-ubuntu-21-04-lock-screen-image


# THIS SCRIPT ISN'T MINE!
# IT IS MADE BY Pratap Kumar
# You can find it at this link:
# https://github.com/PRATAP-KUMAR/focalgdm3/blob/TrailRun/focalgdm3

codename=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d = -f 2)
osname=$(cat /etc/os-release | grep '="Ubuntu"' | cut -d = -f 2)

if [ "$codename" == "focal" ] || [ "$codename" == "groovy" ] || [ "$codename" == "hirsute" ]

then
source="/usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource"
else
echo "
----------------------------------------
Sorry, Script is only for Ubuntu 20.04
Exiting...
----------------------------------------"
exit 1
fi

pkg=$(dpkg -l | grep libglib2.0-dev >/dev/null && echo "yes" || echo "no")
if [ "$pkg" == "no" ]
then
echo "
-----------------------------------------------------------------------------------------------------
Sorry, the package 'libglib2.0-dev' is not installed. Install the package and then run this Script.
For now, Exiting...
-----------------------------------------------------------------------------------------------------"
exit 1
fi

############################################################################################
case "$1" in ###############################################################################
############################################################################################
--help) ####################################################################################
############################################################################################
echo "Use the options /absolute/Image/path or valid 'HEXColorCode' like below
		example 1: sudo ./focalgdm3 /home/admin/mybg.jpg
		example 2: sudo ./focalgdm3 \#245678"
exit 1
;;
############################################################################################
--reset) ###################################################################################
############################################################################################

if ! [ -f /usr/local/share/gnome-shell/theme/focalgdm3.gresource ]
then
echo "
-----------------------------------------------------------------------------
No need, Already Reset. (or unlikely background is not set using this Script.)
-----------------------------------------------------------------------------"
exit 1
elif [ "$UID" != "0" ]
then
echo "This Script must be run with sudo"
exit 1
else
rm /usr/local/share/gnome-shell/theme/focalgdm3.gresource
update-alternatives --quiet --set gdm3-theme.gresource "$source"
cd /usr/local/share
rmdir --ignore-fail-on-non-empty -p gnome-shell/theme
echo "
				     		---------------
						|Reset Success|
						---------------
				Changes will be effective after a Reboot"
exit 1
fi
;;
esac

if [ -z "$1" ]
then
echo "Use the options /absolute/Image/path or valid HEXColorCode like below
		example 1: sudo ./focalgdm3 /home/admin/mybg.jpg
		example 2: sudo ./focalgdm3 \#245678"
exit 1
fi

if [ "$UID" != "0" ]
then
echo "This Script must be run with sudo"
exit 1
fi

cd /tmp

if ! [ -f "$1" ] && ! [[ $1 =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ ]]
then
echo "provided option '$1' is niether valid /absolute/Image/path nor valid 'HEX Color Code'
Exiting without any changes.."
exit 1
fi

if [ -f "$1" ]
then
color='#042320'
img="'file://$1'"
else
color=$1
fi

prefix="/org/gnome/shell/theme"
dest="/usr/local/share/gnome-shell/theme/focalgdm3"

install -D /dev/null $dest/gdm3.css
install -D /dev/null $dest/focalgdm3.gresource.xml
install -d $dest/icons/scalable/actions

gresource extract $source $prefix/gdm3.css > $dest/original.css
gresource extract $source $prefix/checkbox.svg > $dest/checkbox.svg
gresource extract $source $prefix/checkbox-off.svg > $dest/checkbox-off.svg
gresource extract $source $prefix/checkbox-focused.svg > $dest/checkbox-focused.svg
gresource extract $source $prefix/checkbox-off-focused.svg > $dest/checkbox-off-focused.svg
gresource extract $source $prefix/toggle-on.svg > $dest/toggle-on.svg
gresource extract $source $prefix/toggle-off.svg > $dest/toggle-off.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-drag-symbolic.svg > $dest/icons/scalable/actions/pointer-drag-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-enter-symbolic.svg > $dest/icons/scalable/actions/keyboard-enter-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-hide-symbolic.svg > $dest/icons/scalable/actions/keyboard-hide-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-secondary-click-symbolic.svg > $dest/icons/scalable/actions/pointer-secondary-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-shift-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-shift-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-primary-click-symbolic.svg > $dest/icons/scalable/actions/pointer-primary-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-layout-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-layout-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/eye-not-looking-symbolic.svg > $dest/icons/scalable/actions/eye-not-looking-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-double-click-symbolic.svg > $dest/icons/scalable/actions/pointer-double-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/eye-open-negative-filled-symbolic.svg > $dest/icons/scalable/actions/eye-open-negative-filled-symbolic.svg

echo '@import url("resource:///org/gnome/shell/theme/original.css");
  #lockDialogGroup {
  background: '$color' url('$img');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center; }' > $dest/gdm3.css

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
    <file>original.css</file>
    <file>gdm3.css</file>
    <file>toggle-off.svg</file>
    <file>checkbox-off.svg</file>
    <file>toggle-on.svg</file>
    <file>checkbox-off-focused.svg</file>
    <file>checkbox-focused.svg</file>
    <file>checkbox.svg</file>
    <file>icons/scalable/actions/pointer-drag-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-enter-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-hide-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-secondary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-shift-filled-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-primary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-layout-filled-symbolic.svg</file>
    <file>icons/scalable/actions/eye-not-looking-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-double-click-symbolic.svg</file>
    <file>icons/scalable/actions/eye-open-negative-filled-symbolic.svg</file>
  </gresource>
</gresources>' > $dest/focalgdm3.gresource.xml

cd $dest
glib-compile-resources focalgdm3.gresource.xml
mv focalgdm3.gresource ..
rm -r $dest
update-alternatives --quiet --install /usr/share/gnome-shell/gdm3-theme.gresource gdm3-theme.gresource /usr/local/share/gnome-shell/theme/focalgdm3.gresource 0
update-alternatives --quiet --set gdm3-theme.gresource /usr/local/share/gnome-shell/theme/focalgdm3.gresource

check=$(update-alternatives --query gdm3-theme.gresource | grep Value | grep /usr/local/share/gnome-shell/theme/focalgdm3.gresource >/dev/null && echo "pass" || echo "fail")
if [ "$check" == "pass" ]
then
echo "
				     		---------
						|Success|
						---------
				  Changes will be effective after a Reboot"
else
echo Failure
exit 1
fi
