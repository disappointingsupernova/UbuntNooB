#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Secure-delete is used widey throughout this suite. Offering an industry leading eraser
function check_for_secure-delete(){
 if ! [ -x "$(command -v srm)" ]; then
 echo 'Error: Secure Delete is not installed.' >&2
 echo 'Secure Delete is an essential part of the $programname'
 echo 'Now installing Secure Delete'
 sudo apt-get install secure-delete -y
 bash_history_check
fi 
 }