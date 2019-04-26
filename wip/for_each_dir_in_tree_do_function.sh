#!/bin/bash
#DisappointingSupernova - 2019 - Noobix Ubuntu CLI Helper

for d in "template/modules/*"
do
    # mkdir $(basename "$d");
    echo $d;
    echo "$d";
    echo $(basename "$d");
done