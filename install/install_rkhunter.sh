#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

application_name="rkhunter Installer"

source functions

function check_application_status(){
application_to_install="rkhunter"
if ! [ -x "$(command -v " $application_to_install")"]; then
		 echo 'Error: '$application_to_install 'is not installed.' >&2
		 echo 'Now installing '$application_to_install
		 sudo apt-get install -y $application_to_install
		 check_application_status
	 		else
	 			run_rkhunter
fi 
}

function run_rkhunter(){
	sudo rkhunter --update
	sudo rkhunter --check --append-log
}

check_application_status