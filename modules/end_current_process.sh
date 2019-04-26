#!/bin/bash
#DisappointingSupernova - 2019 - UbuntuNoob Ubuntu CLI Helper

source ../src/functions

#PID Applciation Killer

#End the current process
function end_application(){
echo "Kill Process (PID): "
read -r prkill
scriptname=`basename "$prkill"`
pgrep $scriptname
pkill -9 $scriptname
echo $scriptname" Has been terminated"
exit 1
}


