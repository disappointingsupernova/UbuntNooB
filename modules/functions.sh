#!/bin/bash
#DisappointingSupernova - 2019 - UbuntNooB
#The bringing together of differnet sources
#any files required for soruce should be kept in src dir

file_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $file_root/config.sh
source $file_root/install/install_core_applications.sh     
source $file_root/install/check_for_root.sh
source $file_root/install/install_sublime.sh      
source $file_root/install/update_system.sh                  
source $file_root/install/end_current_process.sh
source $file_root/install/utilitymenu.sh          
source $file_root/install/check_site_status.sh              
source $file_root/install/wan_ip.sh
source $file_root/install/encrypted_email.sh      
source $file_root/install/simple_upgrade.sh                 
source $file_root/install/installation_time.sh
source $file_root/install/secure_bash_history.sh  
source $file_root/install/install_rkhunter.sh               
source $file_root/install/required_applications.txt
source $file_root/install/install_software.sh     
source $file_root/install/terminal_cleaner.sh               
source $file_root/install/nordvpn_install.sh      
source $file_root/install/check_system_internet_connect.sh  
source $file_root/install/check_for_root_privilages
source $file_root/install/install_teamviewer.sh   
source $file_root/install/system_report.sh
source $file_root/install/current_sessions.sh     
source $file_root/install/secure_delete.sh
