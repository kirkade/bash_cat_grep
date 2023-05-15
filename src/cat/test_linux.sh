#!/bin/bash

PROG=s21_cat.c


#-E -T --number-nonblank --number --squeeze-blank

# -E TEST

cat -E test.txt > original
./s21_cat -E test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "E TEST SUCCESS\n"
 
else
  printf "E TEST FAILED\n"
  printf "$compare"

fi



# -T TEST

cat -T test.txt>original
./s21_cat -T test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "T TEST SUCCESS\n"

else
  printf "T TEST FAILED\n"
  printf "$compare"

fi



# --number-nonblank TEST

cat --number-nonblank test.txt > original
./s21_cat --number-nonblank test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "number-nonblank TEST SUCCESS\n"

else
  printf "number-nonblank TEST FAILED\n"
  printf "$compare"

fi



# ---number TEST

cat --number test.txt > original
 ./s21_cat --number test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "number TEST SUCCESS\n"

else
  printf "number TEST FAILED\n"
  printf "$compare"
 
fi



# --squeeze-blank TEST

cat --squeeze-blank test.txt > original
 ./s21_cat --squeeze-blank test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "squeeze-blank TEST SUCCESS\n"

else
  printf "squeeze-blank TEST FAILED\n"
  printf "$compare"

fi

# CAT TEST
cat test.txt > original
./s21_cat test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "CAT TEST SUCCESS\n"
  
else
  printf "CAT TEST FAILED\n"
  printf "$compare"

fi



# -b TEST

cat -b test.txt > original
./s21_cat -b test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "b TEST SUCCESS\n"

else
  printf "b TEST FAILED\n"
  printf "$compare"
 
fi



# -e TEST

cat -e test.txt > original
./s21_cat -e test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "e TEST SUCCESS\n"
 
else
  printf "e TEST FAILED\n"
  printf "$compare"
 
fi



# -n TEST

cat -n test.txt > original
./s21_cat -n test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "n TEST SUCCESS\n"

else
  printf "n TEST FAILED\n"
  printf "$compare"
 
fi



# -s TEST

cat -s test.txt > original
./s21_cat -s test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "s TEST SUCCESS\n"

else
  printf "s TEST FAILED\n"
  printf "$compare"
 
fi



# -t TEST

cat -t test.txt > original
./s21_cat -t test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "t TEST SUCCESS\n"
 
else
  printf "t TEST FAILED\n"
  printf "$compare"
 
fi



# -v TEST

cat -v test.txt > original
./s21_cat -v test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "v TEST SUCCESS\n"

else
  printf "v TEST FAILED\n"
  printf "$compare"
 
fi



# no file TEST

cat -v test.tx > original
./s21_cat -v test.tx > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "no file TEST SUCCESS\n"
 
else
  printf "no file TEST FAILED\n"
  printf "$compare"
 
fi



# no flag TEST

cat -p test.txt > original
./s21_cat -p test.txt > copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "no flag TEST SUCCESS\n"

else
  printf "no flag TEST FAILED\n"
  printf "$compare"

fi





rm a.out copy original