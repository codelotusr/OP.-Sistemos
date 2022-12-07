#!/bin/bash

# 2 uzduotis

# 1. Išveskite ekrane nurodytas failo vim_man.txt eilutes:
# print the fifth line of vim_man.txt
sed -n '5p' vim_man.txt

# print only the odd lines
sed -n '1~2p' vim_man.txt

# print lines from 25 to 50
sed -n '25,50p' vim_man.txt

# print the first 10 lines
sed -n '1,10p' vim_man.txt

# print the last line
sed -n '$p' vim_man.txt 

# ai nx yr Roko padarytas variantas