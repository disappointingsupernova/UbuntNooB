#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

#Test if a Site is up

#Check the connection to any given site - url as argument


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

