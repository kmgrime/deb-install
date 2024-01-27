sudo apt install sway swaylock swayidle swaybg waybar pulseaudio firefox firefox neovim dmenu brightnessctl grim slurp pavucontrol xdg-desktop-portal-wlr xwayland sudo

sudo usermod -a -G input <username>

sudo systemctl --user enable pulseaudio.service

mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar

cp /etc/sway/config ~/.config/sway
cp /etc/xdg/swaybar/* ~/.config/waybar


Create this file and run it:

#!/bin env sh
EXPORT WLR_NO_HARDWARE_CURSORS=1
EXPORT WLR_RENDERER_ALLOW_SOFTWARE=1

exec sway

sudo chmod +x startSway.sh

./startSway

