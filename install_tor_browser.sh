#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper


#Create temp install location
function create_temp_folder(){
cd $HOME
dir=.$RANDOM
mkdir $dir
cd $dir
}

function tor_download_locations(){
	release=8.0.8
	dl_url="https://dist.torproject.org/torbrowser"
	folder="tor-browser_en-US/"
}

#Check the debian version
function download_installer(){
arch=`uname -m`
if [ "$arch" == "x86_64" ]
then
    echo "You are running an x86_64 version of Linux"
    echo "I am now downlaoding the 64 Bit Installer"
    version="tor-browser-linux64-"$release"_en-US.tar.xz"
    sig_loc="tor-browser-linux64-"$release"_en-US.tar.xz.asc"
    tor_file_name=$version
    wget $dl_url/$release/$version
    wget $dl_url/$release/$sig_loc
    tar -xvf $tor_file_name
    mv $folder $HOME/$folder
    cd $HOME/$folder
   ./start-tor-browser.desktop
    cd tor-browser_en-US/
else
    echo "You are running an x86_32 version of Linux"
    echo "I am now downlaoding the 32 Bit Installer"
    version="tor-browser-linux32-"$release"_en-US.tar.xz"
    sig_loc="tor-browser-linux32-"$release"_en-US.tar.xz"
    tor_file_name=$version
    wget $dl_url/$release/$version
    wget $dl_url/$release/$sig_loc
    tar -xvf $tor_file_name
    mv $tor_file_name $HOME/$tor_file_name
    cd $HOME/$tor_file_name
    cd tor-browser_en-US/
    cd $folder
     ./start-tor-browser.desktop
    cd tor-browser_en-US/
fi
}


function make_tor_executable(){
	sudo chmod a+x $tor_file_name
}

function install_tor(){
	sudo apt install ./$tor_file_name
}

function remove_temp_dir(){
	cd $HOME
	sudo srm -rfv $dir
}

function install_tor_browser(){
	check_for_root_privilages
	download_locations
	create_temp_folder
	tor_download_installer
	make_tor_executable
	install_tor
	remove_temp_dir
}

install_tor_browser