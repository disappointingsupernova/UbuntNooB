#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

#LSCPU - System Report

#Create a System Report
#need to as lscpu test to the script

source functions
source $file_root/src/core/encrypted_email.sh

function system_report(){
	
	application_name="About the System"
	command="lscpu"
	$command > $file_name
	    create_email_content
	    encrypt_report
	    destroy_unencrypted_report
	    compose_email
	    destroy_encrypted_report
}