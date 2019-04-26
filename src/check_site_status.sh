#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Test if a Site is up

#Check the connection to any given site - url as argument
function check_connection(){

#Get the URL from the user
echo "Enter URL:" 
read -r url

ping -q -c5 -w 1 $url  #Ping the site
if [ $? -eq 0 ] #If the conn is successful
then
	echo
	echo
    echo "Connected to "$url
else
	echo #The ping request will leave an error line - This is simply to make it prett
    echo "Error: "$url"-conn-0"
    echo 
    echo "I was unable to connect to "$url
    echo "Please check your connection to the internet. Otherwise, please report this error."
fi
}

check_connection