#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

#Wide Area Network IP Address 

function wan_ip(){
	wan_file_name="WanIPPInaW.txt"
	curl -s ifconfig.me/ip > $wan_file_name
	wan_ip=$(<$wan_file_name)
	echo $wan_ip
	srm $wan_file_name
}

