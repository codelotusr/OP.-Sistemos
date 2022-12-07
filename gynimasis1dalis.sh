#!/bin/bash

if [[ -n ${1} && -n ${2} ]]
then
    if [[ -f ${2} ]]
    then
        touch ${1}
        cat ${2}
        if [[ -x ${2} ]]
        then
            cp ${2} ${1}
        else
            echo "Ar norite paversti failą vykdomuoju [taip | ne]?"
            read atsakymas
            if [[ ${atsakymas} == "taip" ]]
            then
                chmod +x ${2}
                cp ${2} ${1}
                ls -l
            else
                echo "Pakeitimai nepadaryti"
            fi
        fi
    else
        echo "Netinkama įvestis (1 - būsimas aplankalas, 2 - failas)"
    fi
else
    echo "Trūksta parametrų reikšmių"
fi
echo "Viso gero!"