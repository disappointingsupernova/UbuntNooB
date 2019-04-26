#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

# declare names as an indexed array
declare -a install applcations
 
# initialize the array
names=( nordinsall.sh app_installer.sh  Gary )
 
# access elements of array using index
echo ${names[2]}
 
# you may display the atrributes and value of each element of array
declare -p names