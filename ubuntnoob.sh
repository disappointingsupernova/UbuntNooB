#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

#after SRM first install add the - about secure delete function

# Store menu options selected by the user
INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

#
# Purpose - display output using msgbox 
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "UbuntuNoob" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}


#
# Purpose - display current system date & time
#
function show_date(){
	echo "Today is $(date) @ $(hostname -f)." >$OUTPUT
    display_output 6 60 "Date and Time"
}
#
# Purpose - display a calendar
#
function show_calendar(){
	cal >$OUTPUT
	display_output 13 25 "Calendar"
}


#
# set infinite loop
#
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Linux Shell Script Tutorial" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 15 50 4 \
Date/time "Displays date and time" \
Calendar "Displays a calendar" \
Editor "Start a text editor" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

##System Functions##

function end_applcaiton_installation(){
	echo $application_ident " has been installed"
}

##BEGIN SUDO CHECK FUNCTION##
function check_for_root_privilages(){
if [[ $EUID -ne 0 ]]; then
   sudo -k
    pass=$(whiptail --backtitle "$app_name" --title "Authentication required" --passwordbox "$app_name requires sudo.\n To continue please authenticate for user $USER:" 12 50 3>&2 2>&1 1>&3-)
    exec sudo -S -p '' "$0" "$@" <<< "$pass"
fi
}
##BEGIN SUDO CHECK FUNCTION##

## CHECK RKHUNTER ## 
function rkhunter_check(){
	application_name="RKHunter"
	check_for_root_privilages
	check_rkhunter_installed
}

function run_rkhunter(){
	sudo rkhunter --update
	sudo rkhunter --check --append-log
}

function check_rkhunter_installed(){
application_to_install="rkhunter"
if ! [ -x "$(command -v " $application_to_install")"]; then
		 echo 'Error: '$application_to_install 'is not installed.' >&2
		 echo 'Now installing '$application_to_install
		 sudo apt-get install -y $application_to_install
	 		else
	 			run_rkhunter
fi 
}

##END RKHUNTER##

##CURRENT USERS AND SESSIONS##
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
##END CURRENT SESSIONS##

##BEGIN CORE APP INSTALL FUNCTION##
function core_app_env_check(){
	app_name="Install UbuntuNoob depedancies"
	check_for_root_privilages
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
##END CORE APP INSTALL FUNCTION##

##BEGIN CHECK FOR SECURE-DELETE FUNCTION##
function check_for_secure_delete(){
 if ! [ -x "$(command -v srm)" ]; then
 echo 'Error: Secure Delete is not installed.' >&2
 echo 'Secure Delete is an essential part of the $programname'
 echo 'Now installing Secure Delete'
 sudo apt-get install secure-delete -y
fi 
 }
 ##END CHECK FOR SECURE-DELETE FUNCTION##

#BEGIN SYSTEM UPDATE FUNCTION#
function system_update_check_env(){
	app_name="System Updater"
	check_for_root_privilages
	unset app_name
}

function update(){
	echo "The system will now check for updates"
	sudo apt-get update
}

 function upgrade(){
 	echo "Running the upgrade sequence for " $HOSTNAME
 	sudo apt-get upgrade -y
 }

 function update_cleanup(){
 	sudo apt-get autoclean -y
 	sudo apt-get autoremove -y
 }
 
function system_update(){
system_update_check_env
update
upgrade
update_cleanup
}
#END SYSTEM UPDATE FUNCTION#

##BEGIN SECURE BASH FUNCTION##
function secure_bash_env_check(){
	app_name="Securing Bash History"
	check_for_root_privilages
	unset app_name
}

function bash_sanatise(){
 	 echo "Secure delete is installed - Preflight checks are complete"
 	 echo "Securely clearing the Bash history for " $USER
	 sudo srm -fv $HOME/.bash_history
	 echo "Creating a new Bash history file"
	 touch $HOME/.bash_history #Incase the file itself serves as a depdendacy
	 echo "Correcting permissions"
	 sudo chown $USER:$USER $HOME/.bash_history
	 sudo chmod 600 $HOME/.bash_history
	 echo "The BASH history has been successfully and securly cleared"
}

function prevent_bash_history(){
echo '$app_name is currently preventing any further recording of your Bash history '
echo 'unset HISTFILE' >> ~/.bashrc
echo 'export LESSHISTFILE="-"' >> ~/.bashrc
}

#Clear the current content
function clean(){
	clear
}

#Delete the bash history

 function delete-history(){
 	history -c	
 }

function terminal_cleaner(){
	clear
	history
}

 function secure_bash(){
 	secure_bash_env_check
 	check_for_root_privilages
 	prevent_bash_history
 	clean
	delete-history
 	bash_sanatise
 }
##END SECURE BASH FUNCTION##

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

##BEGIN INSTALL SUBLIME TEXT EDITOR FUNCTION##
#Installation variables
function sublime_env_check(){
	#CHECK ROOT
application_ident="Sublime Text Editor"
app_name=$application_ident
temp_dir="$application_ident_config_dir"
installation_attempted=0
installation_completed=0
}

function check_for_sublime(){
	if [ ! -f /usr/share/applications/sublime_text.desktop ]; then
			echo ""
	    	echo "The sublime executable can not be found"
	    	install_app
		else
			echo "$application_ident is installed"
			exit
	fi
}

function install_app(){
	echo "Would you like to install" $application_to_install "? [Y/N]"
	read make_install
	echo ""
if [[ "$make_install" =~ (yes|y|Y)$ ]]; then
			sublime_setup
	else
		echo "The installation has been cancelled"
fi
}


function install_GPG_key(){ #As the fucntion defines, this isntalls the PGP key for the sublime isntallation
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
}


function allow_https_sources() {
	sudo apt-get install apt-transport-https
}

function choose_release(){
	echo""
	echo "#####################################################"
	echo -n "Would you like to install the stable release(Y/N) ?# " #To grab the users attention as the console doesnt clear for a swhile
	echo "#####################################################"
	read stable_relase
	echo ""
	if [[ "$stable_relase" =~ (yes|y|Y)$ ]]; then
		echo "Installing the stable release for "$application_ident
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	else
		echo "Install the development release for "$application_ident
		echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

	fi
}

function install_sublime(){
sudo apt-get install -y sublime-text 
}

function add_sublime_as_executable(){
if [ ! -f /usr/local/bin/sublime_text ]; then
			echo ""
	    	echo "Sublime has not been added as a BASH executable file"
	    	echo "Now adding Sublime - You can execute it using the command 'subl'"
	    	sudo ln -s /opt/sublime_text/sublime_text /usr/local/bin/sublime_text
	    	echo ""
	    	echo "Sublime is now a bash executable application"
		else
			echo ""
			echo "The sublime executable has been found and no further action is required"
			echo "You can execute it using the command 'subl'"
	fi
}

function use_sublime_as_default(){
	echo -n "Would you like to use Sublime as your Default text editor (Y/N)?"
	read sublime_default
	echo
	if [[ "$sublime_default" =~ (yes|y|Y)$ ]]; then
		echo $application_ident " has been configured as the deafult text editor"
		sudo sed -i 's/gedit/sublime_text/g' /usr/share/applications/defaults.list
	else
		echo "The installation has not made "$application_ident " your default text editor"
	fi
}

function sublime_setup(){
sublime_env_check
check_for_root_privilages #Called from functions
check_for_sublime
install_GPG_key
allow_https_sources
choose_release
update #Called from functions
install_sublime
echo ""
echo $application_ident " has now been installed."
echo "If the application requires a key - Have a look online #WinRAR"
echo ""
add_sublime_as_executable
sublime_end_applcaiton_installation
}
##END SUBLIME INSTALL FUNCTION##

##BEGIN CHECK SITE STATUS FUNCTION##
function get_address_to_check(){
#Get the URL from the user
echo "Enter URL:" 
read -r url
}


function check_connection(){

ping -q -c5 -w 1 $url  #Ping the site
echo "Now checking the connection to $url"
if [ $? -eq 0 ] #If the conn is successful
then
	echo
	echo
    echo "Connected to "$url
else
	echo #The ping request will leave an error line - This is simply to make it prett
    echo "Error: no ping returned from "$url
    echo 
    echo "I was unable to connect to "$url
    echo "Please check your connection to the internet."
    #add link to ipv4 checker
fi
}
##END CHECK SITE STATUS FUNCTION##





# make decsion 
case $menuitem in
	Date/time) show_date;;
	Calendar) show_calendar;;
	Editor) $vi_editor;;
	Exit) echo "Bye"; break;;
esac

done

# if temp files found, delete em
[ -f $OUTPUT ] && check_for_secure_delete && srm $OUTPUT
[ -f $INPUT ] && check_for_secure_delete && srm $INPUT