#!/bin/bash

_curr=`pwd`

echo "Current directory: $_curr"

echo 'Updating...'
sudo apt update

echo 'Installing all tools used...'
sudo apt install fonts-font-awesome lxappearance rofi thunar zsh -y

echo 'Creating symbolic links to files in this folder'
sudo ln -nfs $_curr/.config/i3/config $HOME/.config/i3/config
sudo ln -nfs $_curr/.config/i3status/config $HOME/.config/i3status/config
sudo ln -nfs $_curr/.fonts $HOME/.fonts
sudo ln -nfs $_curr/.themes $HOME/.themes
sudo ln -nfs $_curr/.zshrc $HOME/.zshrc
sudo ln -nfs $_curr/.oh-my-zsh $HOME/.oh-my-zsh
sudo ln -nfs $_curr/cpanel /usr/bin/cpanel
sudo chmod +x $_curr/cpanel

echo 'Remaking font-cache'
fc-cache -fv

echo 'Done! <3'
echo 'Now set zsh as your default shell by running:'
echo 'chsh -s $(which zsh)'