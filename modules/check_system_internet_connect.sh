#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#Check WAN Connection

function check_IPV4(){
ip_add="1.1.1.1"
ip_sp="Cloudflare"
if ping -q -c 1 -W 1 $ip_add >/dev/null; then
  echo "$ip_sp IPv4 is up"
else
  echo "$ip_sp IPv4 is down"
fi
}

function check_IPV4_dns(){
url="a4b.us-east-1.amazonaws.com"
name="AmazonAWS"
if ping -q -c 1 -W 1 a4b.us-east-1.amazonaws.com >/dev/null; then
  echo "$name network is up"
else
  echo "$name network is down"
fi
}

check_IPV4
check_IPV4_dns
