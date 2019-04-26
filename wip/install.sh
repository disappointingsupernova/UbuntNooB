#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Install Noobix 

#V0.1a Mainly layout in comment code, looking to understand how to correctly structure the application to get the best performance and least bugs from the outset


source ./functions

#Initial installation variables
application_ident="Noobix Installer"
temp_dir="$application_ident_setup_dir"
installation_attempted=0
installation_completed=0


#Installation basic functions

function app_to_install(){
	echo "What application would you like to install?"
	read application_to_install
	check_app_not_blank # Checks that the users software input is not blank
}

function check_app_not_blank(){
	if [ ! $application_to_install ];then
		app_to_install
	else
	check_application_status
	fi
}

function check_application_status(){
if ! [ -x "$(command -v $application_to_install )" ]; then
		 echo 'Error: '$application_to_install' is not installed.' >&2
		 		install_app
		 	 		else
	 			echo "$application_to_install is already installed on $HOSTNAME"
fi 
}


function install_app(){
	echo "Would you like to install" $application_to_install "? [Y/N]"
	read make_install
	echo ""
if [[ "$make_install" =~ (yes|y|Y)$ ]]; then
		echo ""
		echo ""
		sudo apt-get install -y $1
		echo "Installation Report"
	else
		echo "The isntallation has been cancelled"
fi
}

#CHECK SYSTEM INSTALLATION DATE AND TIME#
function find_system_installtion_time(){
sudo ls -alct /|tail -1|awk '{print $6, $7, $8}'
}
#CHECK SYSTEM INSTALLATION DATE AND TIME#

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
 


function system_update(){
check_env
update
upgrade
update_cleanup
}
#END SYSTEM UPDATE FUNCTION#


#Text Verianles
function end_applcaiton_installation(){
	echo $application_ident " has been installed"
}


#INSTALLATION FUNCCTIONS FOR USEFUL TOOLS

