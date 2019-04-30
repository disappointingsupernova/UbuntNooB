#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

##eed too add the reaou o the display otherise it wi just it on the menu screen



##BASIC FUNCTION LIST AND EXECUTE##
source ../ubuntnoob.sh	

INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to vi_editor
vi_editor=${EDITOR-vi}

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM77

# Set the application name
suite_name="UbuntuNoob"

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
	dialog --backtitle "$suite_name" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

#
# set infinite loop
#
while true
do

function main_menu(){
### display main menu ###
dialog --clear  --help-button --backtitle "$suite_name" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 15 50 4 \
NordStatus "ChecktheStatus of NordVPN" \
Calendar "Displays a calendar" \
Editor "Start a text editor" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")
}

function run_main_menu(){
	app_name_exe="Main Menu"
	app_command="main_menu"
	echo "Run the $app_name_exe"
	echo "Excute $app_commandq"
}


# make decsion 
case $menuitem in
	NordStatus) about_nord;;
	Calendar) show_calendar;;
	Editor) $vi_editor;;
	Exit) echo "Bye"; break;;
esac
done