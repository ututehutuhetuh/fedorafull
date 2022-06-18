#!/bin/bash

set -e

user=$(whoami)

cd /home/$user

echo "# dwmstatus 2>&1 >/dev/null &" >> .xinitrc
echo "# /home/adji/dwm-bar/dwm_bar.sh &" >> .xinitrc
echo "setxkbmap dvorak &" >> .xinitrc
echo "xrandr --output DisplayPort-0 --mode 1366x768" >> .xinitrc
echo "picom -f &" >> .xinitrc
echo "nitrogen --restore &" >> .xinitrc
echo "exec dwm" >> .xinitrc

git clone https://github.com/ututehutuhetuh/dwm

cd dwm/
mv st-0.8.3/ dwm-6.2/ dwmstatus/ dwm-bar/ /home/$user

cd /home/$user

rm -rf dwm/

cd dwm-6.2/
sudo make clean install
cd ../
cd st-0.8.3/
sudo make clean install
cd ../
cd dwmstatus
make
sudo make PREFIX=/usr install
cd ../
cd dwm-bar/
chmod +x dwm_bar.sh



