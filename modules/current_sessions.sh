#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#List all system users
function local_user_accounts(){
	awk -F: '{ print $1}' /etc/passwd
}

#List all current sessions
function logged_in_users(){
echo
echo "All Connected Clients"
echo
who -a

}

function current_ssh_connections(){
echo
echo "SSH Clients"
echo
sudo netstat -tnpa | grep 'ESTABLISHED.*sshd'
}

function all_users(){
	echo "Would you like to install a long read out of Users?"
	read view_users
	echo ""
			if [[ "$view_users" =~ (yes|y|Y)$ ]]; then
				echo
				echo "Users"
				echo
				compgen -u
				else
					exit
			fi
}

function all_groups(){
	echo "Would you like to install a long read out of all Groups?"
	read view_groups
	echo ""
			if [[ "$view groups" =~ (yes|y|Y)$ ]]; then
				echo
				echo
				echo "Groups"
				compgen -g
			fi
}




function current_sessions(){
	local_user_accounts
	echo
	logged_in_users
	echo
	current_ssh_connections
	all_users
	all_groups
}

