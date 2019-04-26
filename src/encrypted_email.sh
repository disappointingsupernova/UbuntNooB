#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

	#Application Variables
	system_identifier="Wallpaper"
	shred_intensity="4"

	#Email Variables
	email_address="wallpaper@securenet.systems"
	enc_pub_cert="Wallpaper"
	
	#File Name Variables
	file_name="$application_name.txt"
	pgp_file_name="$application_name.txt.gpg"
  	

#Encrypting email content
function create_email_content(){
echo $application_name | gpg -ea -r $enc_pub_cert > body.txt
body=$(<body.txt)
subject="System Alert - $application_name"
shred -vfxn $shred_intensity body.txt
srm -f body.txt
}


#Encrypting the file for email transfer
function encrypt_report(){
echo "Encrypting" $application_name
gpg -e -r $enc_pub_cert $file_name
echo " "
}

#Securely removing the unencrypted files from the disk
function destroy_unencrypted_report(){
echo "Shredding unencrypted" $application_name
echo "Removing the files from disk"
sudo srm -fv $file_name
echo "The files have now been encrypted and the unencrypted files removed from the system"
}

#Compose email to send to email address
function compose_email(){
echo "$body" | mail -r $enc_pub_cert -s "$subject" -a $pgp_file_name $email_address   
echo "The report has been emailed to" $email_address
echo " "
}

#Securely removing the encrypted files from the disk
function destroy_encrypted_report(){
#sudo shred -vfxn $shred_intensity $pgp_file_name
echo "Encrypted files have been scrubbed from disk"
#sudo srm -f $pgp_file_name
echo "The encrypted files have been securly removed from the disk"
echo "The system has now completed the reporting process, please check" $email_address
echo " "
}