#bash inf0sec@tuta.io
#setup mate and rdp on ubuntu 16.04
#version 0.1

echo This script is designed to install MATE desktop and XRDP onto Ubuntu 16.04
echo    # (optional) move to a new line
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

#install desktop
sudo apt-get -y install mate-desktop mate-core mate-desktop-environment mate-notification-daemon xrdp ttf-mscorefonts-installer

#configure mate to work with xrdp
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh

#download a better version of chrome
wget http://www.srware.net/downloads/iron64.deb

#install the browser we just downloaded
sudo dpkg -i iron64.deb
echo You should add a sudo user and reboot your EC2 instance.
echo If all went well you should be able to connect via RDP on the following IP:
echo `ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
fi

