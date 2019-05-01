#!/bin/bash


function key_confirm(){
	cd $HOME
		echo "Quick Sleep"

	sleep 3s

	FILES=$HOME/.ssh/*
		for f in $FILES
		do
		ssh-keygen -E md5 -f $f -l > key_confirm.txt
		ssh-keygen -E sha256 -f $f -l >> key_confirm.txt
		ssh-keygen -E md5 -f $f -l >> key_confirm.txt
		done

		sleep 3s
	
	gpg -r "TheMagicWizard" -e key_confirm.txt
		echo "Quick Sleep"
			sleep 3

	shred -vfzxn 3 key_confirm.txt
	rm key_confirm/.txt
}

key_confirm


