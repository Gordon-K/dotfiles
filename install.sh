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

echo "Cleanup"
rm package_list.txt
