#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Check WAN

function check_WAN(){

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&

if [ $? -eq 0 ]; then
    echo "You are connected to the internet"
else
    echo "You are not connected to the internet"
fi}

function check_LAN(){

IP=$(/sbin/ip route | awk '/default/ { print $3 }')
ping $IP

}