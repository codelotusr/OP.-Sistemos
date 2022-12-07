#!/bin/bash

# 1 uzduotis

allScripts=$(ls *.sh)
echo "Visi vykdomi failai:"
for script in $allScripts
do
    if [[ -x $script ]]
    then
        echo $script
    fi
done
echo "Visu vykdomu failu skaicius: $(echo $allScripts | wc -w)"

