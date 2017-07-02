# RTVPS
Red Team VPS

How to use:

Install Ubuntu 16.04 vps.

Then prep your server to start the install by doing the following
Set hostname (this is not a command, just set it)
sudo apt-get update && sudo apt-get upgrade && sudo reboot

Copy stage1.sh, stage2.sh, stage3,sh & stage4.sh to your home/username directory

There are 4 stages. I would recommend a reboot when it says.

Stage 1

Usage:
#./stage1.sh

This will install mate desktop and rdp, as well as a more secure browser for your remote desktop. When this stage is complete, I would recommend a reboot

Stage 2

#./stage2.sh
This downloads and installs all metasploit requirements. You may have to accept multiple dialogs. It also downloads and setup the ruby environment with rvm, again, a reboot after you finish creating the database user is recommended. When you get to the end of this stage you need to manually do the following:

#sudo -s
#su postgres
#createuser msf -P -D -R -D
#createdb -O msf msf
#exit
#reboot

Stage 3

#./stage3.sh

This downloads metasploits, sets the correct ruby version, installs the bundler and its gems. It also sets various permissions to make everything work well.

After stage 3 you have to manually edit the metasploit config file to match the password and details you created with your postgress user so run and the following command:

sudo nano /opt/metasploit-framework/config/database.yml

Make sure it has the following information in it (but with your password) (file is empty until you populate it)

production:
 adapter: postgresql
 database: msf
 username: msf
 password:
 host: 127.0.0.1
 port: 5432
 pool: 75
 timeout: 5

 Stage 4

 Usage:
 #./stage4.sh

 Stage 4 downloads and installs Armitage and configures it to work with metasploit.

Thats it, in theory, you should be able to run metasploit now with msfconsole
