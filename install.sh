#!/bin/bash

# Update allmost all
sudo apt-get --yes --force-yes update
#sudo apt-get --yes --force-yes dist-upgrade

# Add screen settings and power usage
if grep -c "max_usb_current=1" /boot/config.txt; then
    echo YES
else
    sudo sh -c "sudo echo hdmi_force_hotplug=1 >> /boot/config.txt"
    sudo sh -c "sudo echo hdmi_group=2 >> /boot/config.txt"
    sudo sh -c "sudo echo hdmi_mode=1 >> /boot/config.txt"
    sudo sh -c "sudo echo hdmi_mode=87 >> /boot/config.txt"
    sudo sh -c "sudo echo hdmi_cvt 800 480 60 6 0 0 0 >> /boot/config.txt"
    sudo sh -c "sudo echo max_usb_current=1 >> /boot/config.txt"
    sudo sh -c "sudo echo  >> /boot/config.txt"
fi

# free some space
sudo apt-get --yes --force-yes remove --purge minecraft-pi 
sudo apt-get --yes --force-yes remove --purge scratch
sudo apt-get --yes --force-yes remove --purge wolfram-engine
sudo apt-get --yes --force-yes remove --purge debian-reference-*
sudo apt-get --yes --force-yes remove --purge epiphany-browser*
sudo apt-get --yes --force-yes remove --purge sonic-pi 
sudo apt-get --yes --force-yes remove --purge supercollider*
sudo apt-get --yes --force-yes clean
rm -r /home/pi/python_games/

# install xbmc dependencies
sudo apt-get --yes --force-yes install libssh-4
sudo apt-get --yes --force-yes install libmicrohttpd10
sudo apt-get --yes --force-yes install libtinyxml2.6.2
sudo apt-get --yes --force-yes install libyajl2
sudo apt-get --yes --force-yes install libmysqlclient18 
sudo apt-get --yes --force-yes install liblzo2-2
sudo apt-get --yes --force-yes install libpcrecpp0
sudo apt-get --yes --force-yes install libmysqlclient-dev

# Initialize the radio module
sudo apt-get --yes --force-yes install python-smbus

# Send click events to X windows
sudo apt-get --yes --force-yes install xdotool

# gpsd and tools
sudo apt-get --yes --force-yes install gpsd gpsd-clients

sudo apt-get --yes --force-yes install espeak

sudo rm -f /home/pi/Desktop/debian-reference-common.desktop
sudo rm -f /home/pi/Desktop/epiphany-browser.desktop
sudo rm -f /home/pi/Desktop/minecraft-pi.desktop
sudo rm -f /home/pi/Desktop/pistore.desktop
sudo rm -f /home/pi/Desktop/python-games.desktop
sudo rm -f /home/pi/Desktop/scratch.desktop
sudo rm -f /home/pi/Desktop/sonic-pi.desktop
sudo rm -f /home/pi/Desktop/wolfram-language.desktop
sudo rm -f rm -f /home/pi/Desktop/wolfram-mathematica.desktop

#./rpi-carpc.sh update all

#sudo insserv /etc/init.d/splashscreen
