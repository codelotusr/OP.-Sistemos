#!/bin/bash
PS3="Jūsų pasirinkimas: "

echo "Įveskite prisijungimo vardą bei slaptažodį"
echo "Vardas: "
read vardas
echo "Slaptažodis: "
read -s slaptazodis
if [[ $(grep -c "${vardas} ${slaptazodis}" accounts.txt) -eq 1 ]]
then
    while true
    do
        select pasirinkimas in "stud.txt;" "info.txt;" "lines.txt;" "Darbo pabaiga."
        do
            case $REPLY in
                1)
                    cat stud.txt
                    echo "Įveskite pažymį: "
                    read pazymys
                    echo "Studentai, kurių pažymys yra lygus arba didesnis už nurodytą:"
                    while read firstName lastName courseCode grade evaluation
                    do
                        if [[ $grade -ge $pazymys ]]
                        then
                            echo "$firstName $lastName $grade $courseCode"
                        fi
                    done < stud.txt
                    break;;
                2)  
                    awk -F: '{print $2}' info.txt
                    awk -F: '$1 ~ /Savage/ {print $1, $2}' info.txt
                    break;;
                3)
                    
                    # fix this
                    #sed -i '/^$/d' lines.txt
                    # fix this
                    #sed -i 's/Jon/Jonathan/' lines.txt
                    sed -i '/MA/d' lines.txt
                    sed -i '1iPERSONNEL FILE\n' lines.txt
                    break;;
                4)
                    echo "Darbo pabaiga"
                    exit 0
                    break;;
                *)
                    echo "Neteisingas pasirinkimas"
                    break;;
            esac
        done
    done
else
    echo "Neteisingi prisijungimo duomenys"
fi