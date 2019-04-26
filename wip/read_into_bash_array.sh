#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Create the local dcirectories for the users and the system
declare -a lines
IFS=$'\n' read -d '' -r -a lines < /etc/passwd
declare -p lines