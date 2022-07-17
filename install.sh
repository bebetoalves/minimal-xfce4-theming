echo "Install required packages..." && sleep 2
sudo pacman -S --noconfirm --needed - < ./xfce4-packages

echo "Install Qogir theme..." && sleep 2
git clone https://github.com/vinceliuice/Qogir-theme theme
cd ./theme
./install.sh -t default 
cd ..
rm -rf ./theme

echo "Install Qogir icon theme..." && sleep 2
git clone https://github.com/vinceliuice/Qogir-icon-theme icon-theme
cd ./icon-theme
./install.sh -n Qogir
cd ..
rm -rf ./icon-theme

echo "Setting up XFCE 4 and the settings..." && sleep 2
sudo cp ./wallpaper/slime.png /usr/share/backgrounds/xfce/slime.png
rm -rf ~/.config/Thunar ~/.cache
cp -R .config/ ~/

echo "Setting up lightdm and slick greeter..." && sleep 2
cp /etc/lightdm/lightdm.conf ./lightdm/lightdm.conf
sed -i 's?#logind-check-graphical=false?logind-check-graphical=true?' ./lightdm/lightdm.conf
sed -i 's?#greeter-session=example-gtk-gnome?greeter-session=lightdm-slick-greeter?' ./lightdm/lightdm.conf
sed -i 's?#allow-user-switching=true?allow-user-switching=true?' ./lightdm/lightdm.conf
sudo cp ./lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp ./lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf
