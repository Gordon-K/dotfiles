echo "Updating config files"
cp -r .config ~/
echo "Updating xinitrc"
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

for package in ${PACKAGES[@]}
do 
  echo "$package" >> package_list.txt
done

echo "Updating packages with pacman"
sudo pacman -S - < package_list.txt

echo "Installing git repos"
mkdir -p ~/Downloads
# AwesomeWM Lain
git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain

# Yay
git clone https://aur.archlinux.org/yay.git ~/Downloads
cd ~/Downloads/yay
makepkg -si

echo "Updating AUR packages with yay"
# TODO: Make yay_packages file and loop to parse it like above for pacman
yay -S ani-cli

echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rust.sh
chmod +x rust.sh
./rust.sh

echo "Cleanup"
rm package_list.txt
