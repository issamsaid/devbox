#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt remove lightdm gdm3
sudo apt-get purge compiz-gnome
sudo apt-get autoremove --purge compiz-gnome

sudo apt install -y git ansible python curl i3 i3blocks

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt-get install -y i3-gaps


