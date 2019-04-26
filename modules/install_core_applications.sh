#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

function install_core_system_apps(){

#declare apt functions	
apt="sudo apt-get -qq "
install="install -y"
remove="remove -y"

#Begin software cleanse and update
$apt update
$apt autoremove
clear

# declare names as an indexed array
declare -a install_core_system_applications
declare -a applcations_installed

# initialize the array
install_core_system_applications=("htop" "secure-delete" "wget" "pgpgpg")
applcations_installed=()
 
# for loop that iterates over each element in arr
for i in "${install_core_system_applications[@]}"
	do
		if ! [ -x "$(command -v $i)" ]; then
		 echo 'Error: '$i' is not installed.' >&2
		 echo 'Now installing '$i
		 $apt$install $i
		fi
	done
 }


