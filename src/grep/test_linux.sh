#!/bin/bash

PROG=s21_grep.c


# GREP TEST
grep a test.txt>original
gcc $PROG && ./s21_grep a test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP a TEST SUCCESS\n"
 
else
  printf "GREP a TEST FAILED\n"
  printf "$compare"

fi



# GREP -e a TEST
grep -e a test.txt test2.txt>original
gcc $PROG && ./s21_grep -e a test.txt test2.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -e TEST SUCCESS\n"
 
else
  printf "GREP -e TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -i ASD TEST
grep -i ASD test.txt>original
gcc $PROG && ./s21_grep -i ASD test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -i ASD TEST SUCCESS\n"

else
  printf "GREP -i ASD TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -v asd TEST
grep -v asd test.txt>original
gcc $PROG && ./s21_grep -v asd test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -v asd TEST SUCCESS\n"

else
  printf "GREP -v asd TEST FAILED\n"
  printf "$compare"

fi



# GREP -c a TEST
grep -c a test.txt>original
gcc $PROG && ./s21_grep -c a test.txt >copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -c a TEST SUCCESS\n"

else
  printf "GREP -c a TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -l a TEST
grep -l a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -l a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -l a TEST SUCCESS\n"

else
  printf "GREP -l a TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -n a TEST
grep -n a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -n a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -n a TEST SUCCESS\n"
 
else
  printf "GREP -n a TEST FAILED\n"
  printf "$compare"

fi



# GREP -h a TEST
grep -h a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -h a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -h a TEST SUCCESS\n"

else
  printf "GREP -h a TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -s a TEST
grep -s a test.txt test2.txt>original
gcc $PROG && ./s21_grep -s a test.txt test2.txt>copy


if [ $? -eq 0 ]; then
  printf "GREP -s a TEST SUCCESS\n"

else
  printf "GREP -s a TEST FAILED\n"
  printf "$compare"

fi



# GREP -o a TEST
grep -o a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -o a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -o a TEST SUCCESS\n"

else
  printf "GREP -o a TEST FAILED\n"
  printf "$compare"

fi



# GREP -f pattern.txt TEST
grep -f pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -f pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -f pattern TEST SUCCESS\n"

else
  printf "GREP -f pattern TEST FAILED\n"
  printf "$compare"

fi



## pair combination

# GREP -iv A TEST
grep -iv A test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -iv A test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -iv A TEST SUCCESS\n"

else
  printf "GREP -iv A TEST FAILED\n"
  printf "$compare"

fi



# GREP -in TEST
grep -in a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -in a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -in a TEST SUCCESS\n"

else
  printf "GREP -in a TEST FAILED\n"
  printf "$compare"

fi



# GREP -ih TEST
grep -ih BO test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -ih BO test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -ih BO TEST SUCCESS\n"

else
  printf "GREP -ih BO TEST FAILED\n"
  printf "$compare"

fi



# GREP -ic TEST
grep -ic BO test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -ic BO test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -ic BO TEST SUCCESS\n"

else
  printf "GREP -ic BO TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -il TEST
grep -il BO test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -il BO test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -il BO TEST SUCCESS\n"

else
  printf "GREP -il BO TEST FAILED\n"
  printf "$compare"

fi



# GREP -vc TEST
grep -vc a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -vc a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -vc a TEST SUCCESS\n"

else
  printf "GREP -vc a TEST FAILED\n"
  printf "$compare"

fi



# GREP -vn TEST
grep -vn a test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -vn a test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -vn a TEST SUCCESS\n"

else
  printf "GREP -vn a TEST FAILED\n"
  printf "$compare"

fi



# GREP -vh bo TEST
grep -vh bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -vh bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -vh bo TEST SUCCESS\n"

else
  printf "GREP -vn bo TEST FAILED\n"
  printf "$compare"

fi



# GREP -vl bo TEST
grep -vl bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -vl bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -vl bo TEST SUCCESS\n"

else
  printf "GREP -vl bo TEST FAILED\n"
  printf "$compare"

fi



# GREP -sf pattern.txt TEST
grep -sf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -sf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -sf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -sf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -if pattern.txt TEST
grep -if pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -if pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -if pattern.txt TEST SUCCESS\n"

else
  printf "GREP -if pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -vf pattern.txt TEST
grep -vf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -vf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -vf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -vf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -cf pattern.txt TEST
grep -cf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -cf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -cf pattern.txt TEST SUCCESS\n"
 
else
  printf "GREP -cf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -lf pattern.txt TEST
grep -lf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -lf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -lf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -lf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -nf pattern.txt TEST
grep -nf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -nf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -nf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -nf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -hf pattern.txt TEST
grep -hf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -hf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -hf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -hf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -sf pattern.txt TEST
grep -sf pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -sf pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -sf pattern.txt TEST SUCCESS\n"

else
  printf "GREP -sf pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -of pattern.txt TEST
grep -of pattern.txt test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -of pattern.txt test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -of pattern.txt TEST SUCCESS\n"

else
  printf "GREP -of pattern.txt TEST FAILED\n"
  printf "$compare"

fi



# GREP -oi bo TEST
grep -oi bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -oi bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -oi bo TEST SUCCESS\n"

else
  printf "GREP -oi bo TEST FAILED\n"
  printf "$compare"
 
fi



# GREP -ol bo TEST
grep -ol bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -ol bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -ol bo TEST SUCCESS\n"

else
  printf "GREP -ol bo TEST FAILED\n"
  printf "$compare"

fi



# GREP -oc bo TEST
grep -oc bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -oc bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -oc bo TEST SUCCESS\n"

else
  printf "GREP -oc bo TEST FAILED\n"
  printf "$compare"

fi



# GREP -oh bo TEST
grep -oh bo test.txt test2.txt test3.txt>original
gcc $PROG && ./s21_grep -oh bo test.txt test2.txt test3.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -oh bo TEST SUCCESS\n"
 
else
  printf "GREP -oh bo TEST FAILED\n"
  printf "$compare"

fi




rm a.out copy original
rm -rf *.dSYM