#!/bin/bash

# 2 uzduotis

PS3="Pasirinkite ką veikti su failu [1 - 4]: "
if [[ -n ${1} && -n ${2} ]]
then
    if [[ -f ${1} && -d ${2} ]]
    then
        while true
        do
            select parinktis in "Patikrinti ar failas ${1} yra vykdomasis;" "Paversti failą ${1} vykdomuoju;" "Nukopijuoti failą ${1} į aplankalą ${2};" "Baigti darbą."
            do
                case $REPLY in
                    1) 
                        if [[ -x ${1} ]]
                        then
                            echo "Failas yra vykdomasis"
                        else
                            echo "Failas nėra vykdomasis"
                        fi
                        break;;
                    2)
                        if [[ -x ${1} ]]
                        then
                            echo "Failas jau yra vykdomasis"
                        else
                            chmod +x ${1}
                            echo "Failas paverstas vykdomuoju"
                        fi
                        break;;
                    3)
                        cp ${1} ${2}
                        echo "Failas nukopijuotas"
                        break;;
                    4)
                        echo "Darbas baigtas"
                        exit 0;;
                    *)
                        echo "Netinkamas pasirinkimas"
                        break;;
                esac
            done
        done            
    else
        echo "Netinkama įvestis (1 - failas, 2 - aplankalas)"
    fi
else
    echo "Trūksta parametrų reikšmių"
fi
