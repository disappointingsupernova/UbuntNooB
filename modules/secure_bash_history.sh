#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#Securely remove bash history and prevent further recording of the bash history

function securing_bash_history(){
	source functions
	app_name="Securing Bash History"
}

function check_for_secure-delete(){
 if ! [ -x "$(command -v srm)" ]; then
 echo 'Error: Secure Delete is not installed.' >&2
 echo 'Secure Delete is an essential part of the $programname'
 echo 'Now installing Secure Delete'
 sudo apt-get install secure-delete -y
 bash_history_check
fi 
 }

function bash_sanatise(){
 	 echo "Secure delete is installed - Preflight checks are complete"
 	 echo "Securely clearing the BASH history for " $USER
	 sudo srm -fv $HOME/.bash_history
	 echo "Creating a new BASH history file"
	 touch $HOME/.bash_history
	 echo "Correcting permissions"
	 sudo chown $USER:$USER $HOME/.bash_history
	 sudo chmod 600 $HOME/.bash_history
	 echo "The BASH history has been successfully and securly cleared"
}

function prevent_bash_history(){
echo 'unset HISTFILE' >> ~/.bashrc
echo 'export LESSHISTFILE="-"' >> ~/.bashrc
}

 function bash_history(){
 	application
 	check_for_root_privilages
 	prevent_bash_history
 	bash_history_check
	bash_sanatise

 }

