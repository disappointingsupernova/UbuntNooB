#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#Query the user to see what application they would like to check
function app_to_install(){
		echo "What application would you like to install?"
		read application_to_install #read the application for query
		check_app_not_blank
}	

#Check that there was an input 
function check_app_not_blank(){
	if [ ! $application_to_install ];then
		app_to_install
	else
		check_application_status #if the input is null then restart
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
		echo "The installation has been cancelled"
fi
}	


function app_installer(){
	app_to_install
}

function check_application_status(){
if ! [ -x "$(command -v $application_to_install )" ]; then #performing a check to see if that application is installed 
		 echo ''$application_to_install' is not installed.' >&2
		 		install_app
		 	 		else
	 			echo "$application_to_install is already installed on $HOSTNAME"
fi 
}



app_installer