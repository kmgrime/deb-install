#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y x11-xserver-utils 

# Python installed. PACKAGE INCLUDES build-essential.
sudo apt install -y python3-pip 

# Network Manager
sudo apt install -y nm-tray

# Installation for Appearance management
sudo apt install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
sudo apt install -y thunar xfce4-settings xfce4-power-manager xfce4-terminal

# Terminal (eg. terminator,kitty,xfce4-terminal,tilix)
sudo apt install -y alacritty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# Bluetooth 
sudo apt install -y bluez blueman

sudo systemctl enable bluetooth

# Browser Installation (eg. chromium)
sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart.sh for i3-gaps
# sudo apt install -y nitrogen 
sudo apt install -y feh

# Packages needed i3-gaps after installation
sudo apt install -y dmenu sxhkd numlockx rofi dunst libnotify-bin unzip 

# Command line text editor 
sudo apt install -y neovim

# Install fonts
sudo apt install fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Install i3 
sudo apt install -y i3 i3blocks

# Dependencies for Ly Console Manager
sudo apt install -y libpam0g-dev libxcb-xkb-dev

# Install Ly Console Display Manager
cd 
cd Downloads
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly/
make
sudo make install installsystemd
sudo systemctl enable ly.service

# Lightdm can be used instead of Ly (more common)
# comment out all ly console display if choosing lightdm
# sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# sudo systemctl enable lightdm


# XSessions and i3.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Dynamic window manager
Exec=i3
Icon=i3
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/i3.desktop;rm ./temp

########################################################
# End of script for default config
#

## These two scripts will install nerdfonts and copy my configuration files into the ~/.config directory
## Configuration uses 

source ~/deb-install/nerdfonts.sh
source ~/deb-install/copyconf.sh

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
