#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#Here is the core confirguration for the most personal aspects of the code. 
#These personalised options will affect how the suite interacts with yo
email_address="" #Setup free protonmail account, export public key and import to this machine. 
PGP_PUBLIC_KEY="" #Enter the name or Identifier of the PGP Public Key you wish to use to send encryptedf messages from these scripts
enc_pub_cert=PGP_PUBLIC_KEY #patch for some lazy code at the start of the project - will fix in time 
file_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" #BaseDirectory for the appliactionx
functions=$file_root/src/core/functions #Calling all required functions 
encrypted_email=$file_root/core/encrypted_email.sh #send pgp encrypted mails - remove before prodcution
application_name="${PWD##*/} Folder Backup" #App name varies. Used as email subjects etc
application_file_name="${application_name// /_}" #Replaces spaces with underscores for file compliance
randint=$RANDOM # Generate random int for purposoes unknown
subject="$application_name - $(hostname)$(pwd) - $(date)" #email subject is the current dir nd the time and date
dropbox=$(pwd)/db_ctrl #This script is used to upload backedup files to Dropbox
dropbox_report=$file_name"_report.txt" #A report is generated and uploaded to the same dir as the Dropbox backup
encrypted_dropbox_report="$dropbox_report.gpg" #Report content is encrypted to be emailed to admin at the end of the run
shred_intensity="1" # Number of times a file is shredded before secure-delete (38 Passes)
shred_options="-vfzxn $shred_intensity" #Shred (Verbose, Force, Zero, Exact, Iterations)
NOW=$(date +"%d-%m-%Y") #Needed the good old UK date formatting / Change this accordingly
file_name="${PWD##*/}.$(hostname).$NOW.zip"
pgp_file_name="$file_name.gpg"
use_pgp=1
great="test"
