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
sudo cp -r zsh /usr/share/
sudo cp -r zsh-theme-powerlevel10k /usr/share/
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
cd $USERDIR/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installing powerlevel10k"
yay -S --noconfirm zsh-theme-powerlevel10k-git

echo "Installing fonts"
cd /usr/share/fonts/
sudo mkdir MesloLGS
cd MesloLGS
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
echo "Updating font cache"
fc-cache -vf

echo "Updating libvirtd.conf"
sudo sed 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
sudo sed 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

echo "Adding $USER to libvirt group"
sudo usermod -a -G libvirt $USER

echo "Starting libvertd"
systemctl start libvirtd
systemctl enable libvirtd

# AwesomeWM Lain
rm -rf $USERDIR/.config/awesome/lain
git clone https://github.com/lcpz/lain.git $USERDIR/.config/awesome/lain

echo "Cleanup"
rm -rf $USERDIR/Downloads/yay
