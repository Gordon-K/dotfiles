#!/bin/bash
USERDIR=~/

echo "Updating config files"
cp -r .config ~/
echo "Overwriting xinitrc"
cp .xinitrc ~/
echo "Overwritting zshrc"
cp .zshrc ~/

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

echo "Change shell to ZSH"
chsh -s $(which zsh)

echo "Install plug.vim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Install node for coc"
curl -sL install-node.vercel.app/lts | sudo bash

echo "Creating Downloads directory"
mkdir -p $USERDIR/Downloads

echo "Installing git repos"
# Mononoki Nerdfont
echo "Downloading Mononoki Nerdfont"
mkdir -p $USERDIR/.local/share/fonts
wget https://github.com/madmalik/mononoki/releases/download/1.3/mononoki.zip -O $USERDIR/Downloads/mononoki.zip
unzip $USERDIR/Downloads/mononoki.zip -d $USERDIR/.local/share/fonts/mononoki
echo "Downloading Creattion-Demo"
mkdir -p $USERDIR/.local/share/fonts
wget https://www.1001fonts.com/download/creattion-demo.zip -O $USERDIR/Downloads/creattion-demo.zip
unzip $USERDIR/Downloads/creattion-demo.zip -d $USERDIR/.local/share/fonts/creattion-demo
echo "Updating font cache"
fc-cache

# AwesomeWM Lain
rm -rf $USERDIR/.config/awesome/lain
git clone https://github.com/lcpz/lain.git $USERDIR/.config/awesome/lain

# Yay
git clone https://aur.archlinux.org/yay.git $USERDIR/Downloads/yay
cd $USERDIR/Downloads/yay
makepkg -si

echo "Updating AUR packages with yay"
# TODO: Make yay_packages file and loop to parse it like above for pacman
yay -S ani-cli --needed

echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rust.sh
chmod +x rust.sh
./rust.sh

echo "Cleanup"
rm -rf $USERDIR/Downloads/yay
rm $USERDIR/Downloads/rust.sh
