#!/bin/bash

# 3 uzduotis
while read firstName lastName courseCode grade evaluation
do
    if [[ ${evaluation:0:4} == "FAIL" ]]
    then
        echo "${firstName::1}. ${lastName} ${courseCode} ${grade}"
    fi
done < stud.txt