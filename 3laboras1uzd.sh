#!/bin/bash

# 1 uzduotis
PS3="Jūsų pasirinkimas: "
touch paskyros.txt

while true
do
    select pasirinkimas in "Registruotis;" "Prisijungti;" "Darbo pabaiga."
    do
        case $REPLY in
            1)
                echo "Registracija"
                echo "Įveskite savo vardą: "
                read vardas
                if [[ $(grep -c ${vardas} paskyros.txt) -eq 0 ]]
                then
                    echo "Įveskite savo slaptažodį: "
                    read slaptazodis
                    echo "${vardas} ${slaptazodis}" >> paskyros.txt
                    echo "Registracija sėkminga"
                else
                    echo "Toks vartotojas jau egzistuoja"
                fi
                break;;
            2)
                echo "Prisijungimas"
                echo "Įveskite savo vardą: "
                read vardas
                echo "Įveskite savo slaptažodį: "
                read -s slaptazodis
                if [[ $(grep -c "${vardas} ${slaptazodis}" paskyros.txt) -eq 1 ]]
                then
                    echo "Prisijungimas sėkmingas"
                    while true
                    do
                        select uzduotis in "Didžiausias failas (vardas ir dydis);" "Visi tušti failai;" "Failo empl_min_max.txt eilučių filtravimas pagal MIN_SALARY;" "Baigti darbą."
                        do
                            case $REPLY in
                                1)
                                    visiFailai=$(ls)
                                    echo "Didžiausias failas (vardas ir dydis)"
                                    for failas in $visiFailai
                                    do
                                        if [[ -f $failas ]]
                                        then
                                            dydis=$(wc -c < $failas)
                                            if [[ $dydis -gt $didziausiasDydis ]]
                                            then
                                                didziausiasDydis=$dydis
                                                didziausiasFailas=$failas
                                            fi
                                        fi
                                    done
                                    echo "Didžiausias failas: ${didziausiasFailas} (${didziausiasDydis} baitai)"
                                    break;;
                                2)
                                    echo "Tuščių failų sąrašas:"
                                    find . -type f -empty
                                    break;;
                                3)
                                    echo "Failo empl_min_max.txt eilučių filtravimas pagal MIN_SALARY"
                                    echo "Įveskite MIN_SALARY reikšmę: "
                                    read minSalary
                                    awk -v minSalary=$minSalary '($3 >= minSalary){printf "%-36s %-10s\n", $2,$3 }' empl_min_max.txt
                                    break;;
                                4)
                                    echo "Darbas baigtas"
                                    break 2;;
                                *)
                                    echo "Netinkamas pasirinkimas"
                                    break;;
                            esac
                        done
                    done
                else
                    echo "Neteisingi prisijungimo duomenys"
                fi
                break;;
            3)
                echo "Darbas baigtas"
                exit 0;;
            *)
                echo "Netinkamas pasirinkimas"
                break;;
        esac
    done
done