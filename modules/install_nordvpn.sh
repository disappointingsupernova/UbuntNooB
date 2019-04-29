#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper


##BEGIN NORDVPN INSTALL FUNCTION##
function nord_env_chk(){
app_name="Install NordVPN"
soft_name="NordVPN"
temp_dir="nord_config_dir"
current_nord_dl="nordvpn-release_1.0.0_all.deb"
}

function gather_required(){
	mkdir $temp_dir && cd $temp_dir
	wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$current_nord_dl
}

function add_nord_repo(){
	sudo apt-get install ./$current_nord_dl
	rm ./$current_nord_dl
	sudo apt-get update
}

function install_nord_vpn(){
	sudo apt-get install nordvpn -y
	nordvpn login
}

function configure_nordvpn(){
echo "Now configuring the settings for NordVPN"
nordvpn set protocol UDP
nordvpn set killswitch 1
nordvpn set cybersec 1
nordvpn set autoconnect 1 United_Kingdom
echo "NordVPN Safeguards have been installed"
}

function connect_to_nord(){
echo "Connecting to my preferred server"
nordvpn c manchester
echo 
echo "..."
echo "Checking the status of the NordVPN Connection"
nordvpn status
echo
}

function clean_up(){
echo 'Removing the temporary setup files'
cd ../
sudo rm -r $temp_dir
echo "The installation is now complete"
echo ""
echo "If your login did not work then please run the command 'nordvpn login'"
}

function nord_setup(){
	nord_env_chk
	gather_required
	add_nord_repo
	install_nord_vpn
	configure_nordvpn
	connect_to_nord
	clean_up
}
##END NORDVPN INSTALL FUNCTION##