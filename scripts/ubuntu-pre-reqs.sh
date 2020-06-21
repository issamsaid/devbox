#!/bin/bash

sudo apt -y update && sudo apt -y upgrade
sudo apt remove lightdm gdm3
sudo apt-get purge compiz-gnome
sudo apt-get autoremove -y --purge compiz-gnome

sudo apt install -y git python python3 curl i3 i3blocks python-pip python3-pip 
sudo apt remove --purge ansible 
sudo -H pip uninstall -q ansible > /dev/null
sudo -H pip3 uninstall -q ansible > /dev/null
sudo apt install -y ansible

sudo apt remove --purge libreoffice* firefox
sudo apt remove --purge xdg-user-dirs thunderbird

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get -y update
sudo apt-get install -y i3-gaps


