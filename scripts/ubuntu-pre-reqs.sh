#!/bin/bash
# install ubuntu pre-reqs:
sudo apt -y update && sudo apt -y upgrade
sudo apt -y remove lightdm gdm3
sudo apt -y purge compiz-gnome
sudo apt -y autoremove 

sudo apt -y install git python python3 curl python-pip python3-pip 
sudo apt -y install git i3 i3lock i3blocks
sudo apt -y remove --purge ansible 
sudo -H pip uninstall -q ansible > /dev/null
sudo -H pip3 uninstall -q ansible > /dev/null
sudo apt -y install ansible

sudo apt -y remove --purge libreoffice* firefox
sudo apt -y remove --purge xdg-user-dirs thunderbird

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt -y update
sudo apt -y install i3-gaps

