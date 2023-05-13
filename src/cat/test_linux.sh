#!/bin/bash

PROG=s21_cat.c

counter=1
success=0
fail=0

#-E -T --number-nonblank --number --squeeze-blank

# -E TEST

cat -E test.txt>original
gcc $PROG && ./s21_cat -E test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "E TEST SUCCESS\n"
  ((success++))
else
  printf "E TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# -T TEST

cat -T test.txt>original
gcc $PROG && ./s21_cat -T test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "T TEST SUCCESS\n"
  ((success++))
else
  printf "T TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# --number-nonblank TEST

cat --number-nonblank test.txt>original
gcc $PROG && ./s21_cat --number-nonblank test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "--number-nonblank TEST SUCCESS\n"
  ((success++))
else
  printf "--number-nonblank TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# ---number TEST

cat --number test.txt>original
gcc $PROG && ./s21_cat --number test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "--number TEST SUCCESS\n"
  ((success++))
else
  printf "--number TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# --squeeze-blank TEST

cat --squeeze-blank test.txt>original
gcc $PROG && ./s21_cat --squeeze-blank test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "---squeeze-blank TEST SUCCESS\n"
  ((success++))
else
  printf "--squeeze-blank TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

printf "SUCCESS $((success))\n"
printf "FAILED $((failed))\n"

rm a.out copy original