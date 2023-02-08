#!/bin/bash
USERDIR=~/

echo "Updating config files"
cp -r .config ~/
echo "Overwriting xinitrc"
cp .xinitrc ~/

IFS=$'\n'

echo "Reading packages from packages"
PACKAGES=()
for line in $(cat packages)
do
  if [[ "$line" != \#* ]]
  then
    PACKAGES+=($line)
  fi
done

echo "Installing packages with pacman"
sudo pacman -Syu
rm $USERDIR/Downloads/package_list.txt
for package in ${PACKAGES[@]}
do 
  sudo pacman -S $package --needed --noconfirm
done

echo "Copying over Manjaro zsh config"
cp -r zsh /usr/share/
cp -r zsh-theme-powerlevel10k /usr/share/
echo "Overwritting zshrc"
cp .zshrc ~/

echo "Change shell to ZSH"
chsh -s $(which zsh)

echo "Install plug.vim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Install node for coc"
curl -sL install-node.vercel.app/lts | sudo bash

echo "Creating Downloads directory"
mkdir -p $USERDIR/Downloads

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installing powerlevel10k"
yay -S --noconfirm zsh-theme-powerlevel10k-git

echo "Installing git repos"
# Mononoki Nerdfont
echo "Downloading Mononoki Nerdfont"
mkdir -p $USERDIR/.local/share/fonts
wget https://github.com/madmalik/mononoki/releases/download/1.3/mononoki.zip -O $USERDIR/Downloads/mononoki.zip
unzip $USERDIR/Downloads/mononoki.zip -d $USERDIR/.local/share/fonts/mononoki
echo "Updating font cache"
fc-cache -vf

# AwesomeWM Lain
rm -rf $USERDIR/.config/awesome/lain
git clone https://github.com/lcpz/lain.git $USERDIR/.config/awesome/lain

echo "Cleanup"
rm -rf $USERDIR/Downloads/yay
