#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

source functions

#Create teamviewer temp install file
function create_temp_folder(){
cd $HOME
dir=.$RANDOM
mkdir $dir
cd $dir
}

#Check the debian version
function download_installer(){
arch=`uname -m`
if [ "$arch" == "x86_64" ]
then
    echo "You are running an x86_64 version of Linux"
    echo "I am now downlaoding the 64 Bit Installer"
    version="teamviewer_amd64.deb"
    wget https://download.teamviewer.com/download/linux/$version
else
    echo "You are running an i686 version of Linux"
    echo "I am now downlaoding the 32 Bit Installer"
    version="teamviewer_i386.deb"
    wget https://download.teamviewer.com/download/linux/$version
fi
}

function make_executable(){
	chmod a+x $version
}

function install_tv(){
	sudo apt install ./$version
}

function remove_temp_dir(){
	cd $HOME
	sudo rm -r $dir
}

function execute(){
	check_for_root_privilages
	create_temp_folder
	download_installer
	make_executable
	install_tv
	remove_temp_dir
}