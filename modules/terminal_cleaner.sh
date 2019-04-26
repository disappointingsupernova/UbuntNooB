#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#The most simple of simple scripts.
#Cleans the current bash terminal

function application(){
app_name="Terminal Cleaner"
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


#Run the applcation

#Development NOTE 
#Call the advanced wipedown of the bash terminal and off to add a forget bash to the system
