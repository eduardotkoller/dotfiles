#!/bin/bash

_curr=`pwd`

echo "Current directory: $_curr"

echo 'Updating...'
sudo apt update

echo 'Installing all tools used...'
sudo apt install fonts-font-awesome lxappearance rofi thunar zsh feh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo 'Creating symbolic links (i3 & oh-my-zsh configs) and copying files (themes, fonts, icons)'
sudo ln -fs $_curr/.config/i3/config $HOME/.config/i3/config
sudo ln -fs $_curr/.config/i3status/config $HOME/.config/i3status/config
sudo ln -fs $_curr/.zshrc $HOME/.zshrc
sudo cp -a $_curr/.themes/. $HOME/.themes/
sudo cp -a $_curr/.fonts/. $HOME/.fonts/
sudo cp -a $_curr/.icons/. $HOME/.icons/
sudo cp -a $_curr/.oh-my-zsh/. $HOME/.oh-my-zsh/
sudo cp $_curr/wallpaper.jpg $HOME/Pictures/wallpaper.jpg

sudo ln -fs $_curr/cpanel /usr/bin/cpanel
sudo chmod +x $_curr/cpanel


echo 'If needed, remake font cache with:'
echo -e 'fc-cache -fv\n'
echo 'Done! <3'
echo 'Now set zsh as your default shell by running:'
echo 'chsh -s $(which zsh)'
echo 'Dont forget to change terminal font to any powerline font (Input Mono is installed)'