#!/bin/bash

PROG=s21_cat.c

counter=1
success=0
fail=0

# CAT TEST
cat test.txt>original
gcc $PROG && ./s21_cat test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "CAT TEST SUCCESS\n"
  ((success++))
else
  printf "CAT TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -b TEST

cat -b test.txt>original
gcc $PROG && ./s21_cat -b test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "b TEST SUCCESS\n"
  ((success++))
else
  printf "b TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -e TEST

cat -e test.txt>original
gcc $PROG && ./s21_cat -e test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "e TEST SUCCESS\n"
  ((success++))
else
  printf "e TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -n TEST

cat -n test.txt>original
gcc $PROG && ./s21_cat -n test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "n TEST SUCCESS\n"
  ((success++))
else
  printf "n TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -s TEST

cat -s test.txt>original
gcc $PROG && ./s21_cat -s test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "s TEST SUCCESS\n"
  ((success++))
else
  printf "s TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -t TEST

cat -t test.txt>original
gcc $PROG && ./s21_cat -t test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "t TEST SUCCESS\n"
  ((success++))
else
  printf "t TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -v TEST

cat -v test.txt>original
gcc $PROG && ./s21_cat -v test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "v TEST SUCCESS\n"
  ((success++))
else
  printf "v TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# no file TEST

cat -v test.tx>original
gcc $PROG && ./s21_cat -v test.tx>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "no file TEST SUCCESS\n"
  ((success++))
else
  printf "no file TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# no flag TEST

cat -p test.txt>original
gcc $PROG && ./s21_cat -p test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "no flag TEST SUCCESS\n"
  ((success++))
else
  printf "no flag TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

printf "SUCCESS $((success))\n"
printf "FAILED $((failed))\n"

rm a.out copy original