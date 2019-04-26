#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#Install Sublime Text Editor

#Installation variables
application_ident="Sublime Text Editor"
app_name=$application_ident
temp_dir="$application_ident_config_dir"
installation_attempted=0
installation_completed=0

function install_app(){
	echo "Would you like to install" $application_to_install "? [Y/N]"
	read make_install
	echo ""
if [[ "$make_install" =~ (yes|y|Y)$ ]]; then
			sublime_setup
	    	installation_attempted=1
	    	confirm_installation
			echo "Installation Report"
	else
		echo "The installation has been cancelled"
fi
}

function install_app(){
	echo "Would you like to install" $application_to_install "? [Y/N]"
	read make_install
	echo ""
if [[ "$make_install" =~ (yes|y|Y)$ ]]; then
			sublime_setup
	    	installation_attempted=1
	    	confirm_installation
			echo "Installation Report"
	else
		echo "The installation has been cancelled"
fi
}

function begin_sublime_install(){
	if [ ! -f /usr/share/applications/sublime_text.desktop ]; then
			echo ""
	    	echo "The sublime executable can not be found"
	    	install_app
		else
			echo "$application_ident is installed, would you like to reinstall or repair it?"
	fi
}

function confirm_installation(){
	if [ installation_attempted = 1 ]; then
		begin_sublime_install
		installation_attempted=0
		echo ""
		echo "The system failed to installed "$application_ident
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
	echo "###################################################"
	echo -n "Would you like to install the stable release?  #" #To grab the users attention as the console doesnt clear for a swhile
	echo "###################################################"
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
	echo -n "Would you like to use Sublime as your Default text editor?"
	read sublime_default
	echo
	if [[ "$sublime_default" =~ (yes|y|Y)$ ]]; then
		echo $application_ident " has been configured as the deafult text editor"
		sudo sed -i 's/gedit/sublime_text/g' /usr/share/applications/defaults.list
	else
		echo "The installation has not made "$application_ident " your default text editor"
	fi
}


function install_sublime(){
sudo apt-get install -y sublime-text 
}


function clean_up(){
history -c
}

function end_applcaiton_installation(){
	echo $application_ident " has been installed"
}

function sublime_setup(){
check_for_root_privilages #Called from functions
install_GPG_key
allow_https_sources
choose_release
update #Called from functions
install_sublime
echo $application_ident " has now been installed."
echo "If the application requires a key - Have a look online #WinRAR"
add_sublime_as_executable
clean_up
end_applcaiton_installation
}

#Run appications
begin_sublime_install
