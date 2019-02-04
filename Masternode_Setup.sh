#!/bin/sh
# A shell script written to automate the MNBC Masternode Setup Process

Green=$(echo '\033[00;32m')
Cyan=$(echo '\033[00;36m')
RED=$(echo '\033[00;31m')
YELLOW=$(echo  '\033[00;33m')

echo "${Green}Im Starting to update!"
	apt update

echo "${Green}I've Finished updating! Now I need to upgrade."
	apt upgrade -y

echo "${Green}I've finished upgrading! Now I need to install dependencies"
	sudo apt-get install nano unzip git -y

echo "${Green}I've finished installing dependencies! Now I'll make folders and download the wallet."
	wget https://github.com/MNBrowsing/MN-Browsing-Coin/releases/download/v1.0/MNBC-1.0.0-x86_64-pc-linux-gnu.zip
	unzip MN MNBC-1.0.0-x86_64-pc-linux-gnu.zip
	chmod +x mnbrowsingcoin*
	
	./mnbrowsingcoind -daemon
	sleep 5
	./mnbrowsingcoin-cli stop
echo "${Green}I've finished making folders and downloading the wallet! Now I'll create your mnbrowsingcoin.conf file."	
	cd /root/.mnbrowsingcoin/
	touch /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	touch /root/.mnbrowsingcoin/masternode.conf
	echo "rpcallowip=127.0.0.1" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	sleep 5
	echo "${Green}Enter an RPC username (It doesn't matter really what it is, just try to make it secure)"
		read username
			echo "rpcuser=$username" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf

	echo "${Green}Enter an RPC password(It doesn't matter really what it is, just try to make it secure)"
		read password
			echo "rpcpassword=$password" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	
	echo "server=1" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	echo "listen=1" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	echo "staking=1" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	echo "port=59867" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	echo "masternode=1" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	
	echo "${Green}What is the Global IP of your VPS? I'll put this into your config file for you because I'm so nice."
		read VPSip
			echo "masternodeaddr=$VPSip:59867" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
			echo "bind=$VPSip:59867" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
			echo "externalip=$VPSip:59867" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf
	         
	echo "${Green}What is your masternode genkey? I'll put this into your config file."
		read genkey
			echo "masternodeprivkey=$genkey" >> /root/.mnbrowsingcoin/mnbrowsingcoin.conf

	
echo "${YELLOW}Okay, it looks like you are all set. Let's startup the daemon!"
	cd /root/

	./mnbrowsingcoind -daemon
