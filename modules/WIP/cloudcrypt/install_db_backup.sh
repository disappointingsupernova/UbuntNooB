#!/bin/bash
#Louis Blissett - 2019 - System Management Scripts

###########################################################################################################
#Special thanks to Andrea Fabrizi <andrea.fabrizi@gmail.com> for Dropbox Uploader Copyright (C) 2010-2017 #
#https://github.com/andreafabrizi/Dropbox-Uploader/														  #
#Fabrizi's code is used as the foundation of the upload functionality 									  #
#Contributions from Andrea Fabrizi will be noted with 'AF'
###########################################################################################################

#Bakrypt
#This system will perform an emergency backup of a directory to your dropbox - This function also supports PGP encryption before transmitting the file

#Application dependencies
app_ident="Bakrypt"
app_name=$app_ident
Auth_Token=.oauth
source ../../../functions



function check_env(){
dropbox_check #Run a connection check to the Dropboc API
}


#Check the connection to Dropbox
function dropbox_check(){
ping -q -c5 api.dropboxapi.com > /dev/null #Ping the dropbox API
    if [ $? -eq 0 ]
        then
            echo "Connected to Dropbox"
        else
            echo #The ping request will leave an error line - This is simply to make it pretty
            echo "Error: db-conn-0"
            echo 
            echo "I was unable to connect to the Dropbox API"
            echo "Please check your connection to the internet. Otherwise, please report this error."
            echo "The installer will now exit"
            exit 1
    fi
}

#Create session specific temp files
function start_db_config(){
echo
    touch $dropbox_report
    touch body.txt
    echo $app_ident "will now begin the setup process"
echo
}

#Destroy session specific temp files
function sanitise(){
#TODO
echo
}

#Check the system to see if the access token has laready been registed
function auth_test()
{
auth=$(<.oauth)
clear
if [[ $auth =~ .*OAUTH_ACCESS_TOKEN.* ]]
then
   echo "The Dropbox API has already been added to "$app_ident
   echo "No further configuration is required"
   exit 1
else
    configure_dropbox_access
fi
}

#AF
function configure_dropbox_access(){
#CHECKING FOR AUTH FILE
if [[ -e $Auth_Token ]]; then

    #Loading data... and change old format config if necesary.
    source "$Auth_Token" 2>/dev/null || {
        sed -i'' 's/:/=/' "$Auth_Token" && source "$Auth_Token" 2>/dev/null
    }

    #Checking if it's still a v1 API configuration file
    if [[ $APPKEY != "" || $APPSECRET != "" ]]; then
        echo -ne "The config file contains the old deprecated v1 oauth tokens.\n"
        echo -ne "Please run again the script and follow the configuration wizard. The old configuration file has been backed up to $Auth_Token.old\n"
        mv "$Auth_Token" "$Auth_Token".old
        exit 1
    fi

    #Checking loaded data
    if [[ $OAUTH_ACCESS_TOKEN = "" ]]; then
        echo -ne "Error loading data from $Auth_Token...\n"
        echo -ne "It is recommended to run $0 unlink\n"
        exit 1
    fi

#Generate new Dropbox Auth Token
else

    echo -ne "\n Please follow the instructions to configure the dropbox access token:\n\n"
    echo -ne " 1) Open the following URL in your Browser, and log in to dropbox: $APP_CREATE_URL\n"
    echo -ne " 2) Click on \"Create App\", then select \"Dropbox API app\"\n"
    echo -ne " 3) Now go on with the configuration, choosing the app permissions and access restrictions to your DropBox folder\n"
    echo -ne " 4) Enter " $app_ident" as the \"App Name\"\n\n"

    echo -ne " Now, click on the \"Create App\" button.\n\n"

    echo -ne " When your new App is successfully created, please click on the Generate button\n"
    echo -ne " under the 'Generated access token' section, then copy and paste the new access token here:\n\n"

    echo -ne " # Access token: "
    read -r OAUTH_ACCESS_TOKEN

    echo -ne "\n > The access token is $OAUTH_ACCESS_TOKEN. Looks ok? [y/N]: "
    read -r answer
    if [[ $answer != "y" ]]; then
        exit 1
    fi

    echo "OAUTH_ACCESS_TOKEN=$OAUTH_ACCESS_TOKEN" > "$Auth_Token"
    echo "The configuration has been saved."

    exit 0
fi
} 	


start_db_config
auth_test