#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#System Update

#BEGIN SYSTEM UPDATE FUNCTION#
function check_env(){
	source functions
	app_name="System Updater"
	check_for_root_privilages
}
#CONTACT REPOS TO CHECK FOR UPDATES#
function update(){
	echo "The system will now check for updates"
	sudo apt-get update
}

#IFUPDATES AVAILBLE THEN SYSTEM INSTALLS UPDATED
 function upgrade(){
 	echo "Running the upgrade sequence for " $HOSTNAME
 	sudo apt-get upgrade -y
 }

 #AFTER UPGRADE CLEAN UP
 function update_cleanup(){
 	sudo apt-get autoclean -y
 	sudo apt-get autoremove -y
 }

 function run_upgrade(){
 	check_env
 	update
 	upgrade
 	update_cleanup
 }