#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

file_location=$HOME/.ssh/FingerPrints.txt
function key_confirm(){

echo "Generating fingerprint for each file"

FILES=$HOME/.ssh/*
		for f in $FILES
		do
		cd $HOME/.ssh
		ssh-keygen -E md5 -f $f -l > $file_location
		ssh-keygen -E sha256 -f $f -l >> $file_location
		ssh-keygen -E md5 -f $f -l >> $file_location
		done

echo "Now encryting the file using my Certificate of choice"
		cd $HOME/.ssh
			gpg -r "TheMagicWizard" -e $file_location

echo "Encrypted files have been created - now removing the unencrpyted files" 
#Pretty sure this can be doen without haveing to create a file first. encrypt the variable and then dump it... 
#Does it offer the same protection as 38 pass srm?
	shred -vfzxn 3 $file_location
	rm $file_location
}
key_confirm