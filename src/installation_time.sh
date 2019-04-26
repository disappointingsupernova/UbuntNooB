#!/bin/bash
#DisappointingSupernova - 2019 - Noobix
#Added to Installer

#System installation time
function find_system_installtion_time(){
sudo ls -alct /|tail -1|awk '{print $6, $7, $8}'
}

find_system_installtion_time