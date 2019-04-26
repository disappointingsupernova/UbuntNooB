#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#BEGIN SYSTEM UPDATE FUNCTION#
function check_env(){
	app_name="System Updater"
	check_for_root_privilages
}

#Checks to see if the user is a sudoer -
function update(){
	echo "The system will now check for updates"
	sudo apt-get update
	

}

 function upgrade(){
 	echo "Running the upgrade sequence for " $HOSTNAME
 	sudo apt-get upgrade -y
 	update_cleanup
 }

 function update_cleanup(){
 	sudo apt-get autoclean -y
 	sudo apt-get autoremove -y
 }
 


function system_update(){
check_env
update
upgrade
update_cleanup
}
#END SYSTEM UPDATE FUNCTION#

