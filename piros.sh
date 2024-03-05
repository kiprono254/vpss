#!/bin/bash

sudo apt-get install iptables

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT 
iptables -P FORWARD ACCEPT 
iptables -F 
sudo cp /etc/iptables/rules.v6 /etc/iptables/rules.v6.bak 
sudo truncate -s 0 /etc/iptables/rules.v6

apt install ufw - y

ufw allow 22,443,4555,80/tcp && ufw --force enable

systemctl stop stunnel4 nodews1 badvpn apache2 nginx xray



rm -f /etc/banner.html && rm -rf /etc/stunnel/


sudo apt update -y && sudo apt upgrade -y

apt-get install -y lsb-release cron iptables ufw nano stunnel certbot dropbear squid cmake make gcc build-essential nodejs unzip zip tmux

sudo systemctl stop apache2

wget -q https://raw.githubusercontent.com/kiprono254/badvpn/main/badvpn-master.zip 
unzip -o badvpn-master.zip 
cd badvpn-master 
rm -f build
mkdir build 
cd build 
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 
sudo make install 
cd $HOME 
cd /etc/systemd/system 
wget https://raw.githubusercontent.com/kiprono254/nodews/main/nodews1.service 
cd /etc 
mkdir -p p7common 
cd p7common 
wget https://raw.githubusercontent.com/kiprono254/proxy/main/proxy3.js 
cd $HOME 

cd /etc/systemd/system 
wget https://raw.githubusercontent.com/kiprono254/badvpnsvc/main/badvpn.service 
cd $HOME 
sudo rm /etc/shells 
cd /etc/ 
wget https://raw.githubusercontent.com/kiprono254/york/main/shells  
cd $HOME 
sudo rm /etc/default/dropbear 
cd /etc/default 
wget https://raw.githubusercontent.com/kiprono254/sshdrp/main/dropbear 

cd /etc
wget https://raw.githubusercontent.com/kiprono254/ban/main/banner.html

cd $HOME 

sudo apt-get remove speedtest-cli


curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash

sudo apt-get install speedtest

cd $HOME

service dropbear restart
systemctl start badvpn 
systemctl start stunnel4 
systemctl start nodews1 
systemctl enable badvpn 
systemctl enable nodews1 
systemctl enable stunnel4 
# systemctl status nodews1 
# systemctl status badvpn 
# systemctl status stunnel4 
systemctl disable apache2 
