sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update && sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev gnupg2
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
ruby -v
mkdir ~/Development
cd ~/Development
git clone https://github.com/nmap/nmap.git
cd nmap
./configure
make
sudo make install
make clean
echo
echo Now you need to type sudo -s and then su postgres to setup your database
echo createuser msf -P -D -R -D
echo createdb -O msf msf
echo and then type exit and exit
echo rebooting in 10 seconds
sleep 1


