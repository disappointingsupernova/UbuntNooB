#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#System installation time
function find_system_installtion_time(){
sudo ls -alct /|tail -1|awk '{print $6, $7, $8}'
}

