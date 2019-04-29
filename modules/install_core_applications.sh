#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper


function core_app_env_check(){
	app_name="Install UbuntuNoob depedancies"
	#ROOT PERM
}

function easy_apt(){
apt="sudo apt-get -qq "
install="install -y"
remove="remove -y"	
}

function update_repos(){
$apt update
clear
}

function core_app_array_declare(){
# declare names as an indexed array
declare -a install_core_system_applications
declare -a applcations_installed
}


# initialize the array
function core_app_fill_array(){
install_core_system_applications=("htop" "secure-delete" "wget" "pgpgpg")
core_applications_explained=("A great Task Manager" "A very secure file remover" "Allows for the download of files from the internet" "Used to create and manage encrytion keys")
applcations_installed=()
}

function install_core_system_apps(){ 
# for loop that iterates over each element in arr
for i in "${install_core_system_applications[@]}"
	do
		if ! [ -x "$(command -v $i)" ]; then
		 echo 'Error: '$i' is not installed.' >&2
		 echo 'Now installing ' $i && echo ${core_applications_explained[@]} 
		 $apt$install $i
		fi
	done
 }

function core_install(){
core_app_env_check
easy_apt
update_repos
core_app_array_declare
core_app_fill_array
install_core_system_apps
}

core_install