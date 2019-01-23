#!/bin/bash

_curr=`pwd`

echo "Current directory: $_curr"

sudo add-apt-repository ppa:papirus/papirus
echo 'Updating...'
sudo apt update

echo 'Installing all tools used...'
sudo apt install i3 fonts-font-awesome lxappearance rofi thunar zsh feh xserver-xorg-input-synaptics compton papirus-icon-theme papirus-folders xclip maim -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo 'Creating symbolic links (i3 & oh-my-zsh configs) and copying files (themes, fonts, icons)'
sudo ln -fs $_curr/.config/i3/config $HOME/.config/i3/config
sudo ln -fs $_curr/.config/i3status/config $HOME/.config/i3status/config
sudo ln -fs $_curr/.zshrc $HOME/.zshrc
sudo cp -a $_curr/.themes/. $HOME/.themes/
sudo cp -a $_curr/.fonts/. $HOME/.fonts/
sudo cp -a $_curr/.icons/. $HOME/.icons/
sudo cp -a $_curr/.oh-my-zsh/. $HOME/.oh-my-zsh/
sudp cp $_curr/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
sudo cp $_curr/.config/gtk-4.0/settings.ini $HOME/.config/gtk-4.0/settings.ini
sudo cp $_curr/.gtkrc-2.0 $HOME/.gtkrc-2.0
sudo mkdir $HOME/Pictures/wallpapers
sudo cp -a $_curr/wallpapers/* $HOME/Pictures/wallpapers/
sudo cp $_curr/Custom.rasi /usr/share/rofi/themes/Custom.rasi

papirus-folders -C orange

sudo ln -fs $_curr/cpanel /usr/bin/cpanel
sudo chmod +x $_curr/cpanel

sudo ln -fs $_curr/screenshot-clipboard /usr/bin/screenshot-clipboard
sudo chmod +x $_curr/screenshot-clipboard

read -p "Build and install polybar (y/n)? " choice
case "$choice" in 
  y|Y ) sudo $_curr/build-install-polybar.sh;
  sudo ln -fs $_curr/.config/polybar/config $HOME/.config/polybar/config;;
  n|N ) echo "";;
  * ) echo "invalid";;
esac

read -p "Build and install i3gaps (y/n)? " choice
case "$choice" in 
  y|Y ) sudo $_curr/build-install-i3gaps.sh;
  sudo ln -fs $_curr/.config/i3/config $HOME/.config/i3/config;;
  n|N ) echo "";;
  * ) echo "invalid";;
esac

read -p "Build and install betterlockscreen (y/n)? " choice
case "$choice" in 
  y|Y ) sudo $_curr/build-install-betterlockscreen.sh;
  betterlockscreen -u ~/Pictures/wallpapers;;
  n|N ) echo "";;
  * ) echo "invalid";;
esac


read -p "run lxappearance to customize look & feel (y/n)? " choice
case "$choice" in 
  y|Y ) lxappearance &;;
  n|N ) echo "";;
  * ) echo "invalid";;
esac

echo 'If needed, remake font cache with:'
echo -e 'fc-cache -fv\n'
echo 'Done! <3'
echo 'To set zsh as your default shell by running:'
echo 'chsh -s $(which zsh)'
echo 'Dont forget to change terminal font to any powerline font (Input Mono is installed)'
