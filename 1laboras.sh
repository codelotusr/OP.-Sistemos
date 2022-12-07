#!bin/bash

# 1 uzduotis
mkdir -pv DIR1 DIR2/{DIR3,DIR4/DIR5} DIR6

# 2 uzduotis
touch DIR2/DIR3/f{1..2}
cp -v DIR2/DIR3/f{1..2} DIR1

# 3 uzduotis
ls -l

# 4 uzduotis
rm DIR2/DIR3 -r

# 5 uzduotis
cat > DIR2/file1.txt
echo -e "Hello world!\nBob is dead!" >> DIR2/file1.txt
cat > DIR2/file2.txt
echo -e "Hello world!\nBob is apparently alive!" >> DIR2/file2.txt
cat DIR2/file1.txt DIR2/file2.txt > DIR2/file3.txt
cat DIR2/file3.txt

# 6 uzduotis
wc -l DIR2/file1.txt DIR2/file2.txt > DIR2/file4.txt
wc -w DIR2/file1.txt DIR2/file2.txt >> DIR2/file4.txt
cat DIR2/file4.txt

# 7 uzduotis
yearDate=$(date +%F)
weekDay=$(date +%A)
weekNumber=$(date +%U)
echo -e "DATE: $yearDate\nWEEKDAY: $weekDay\nWEEK NUMBER: $weekNumber"