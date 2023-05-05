#!/bin/bash

PROG=main.c

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

#-E -T --number-nonblank --number --squeeze-blank

## -E TEST
#
#cat -E test.txt>original
#gcc $PROG && ./s21_cat -E test.txt>copy
#compare=$(diff original copy)
#
#if [ $? -eq 0 ]; then
#  printf "E TEST SUCCESS\n"
#  ((success++))
#else
#  printf "E TEST FAILED\n"
#  printf "$compare"
#  ((failed++))
#fi
#
#((counter++))
#
## -T TEST
#
#cat -T test.txt>original
#gcc $PROG && ./s21_cat -T test.txt>copy
#compare=$(diff original copy)
#
#if [ $? -eq 0 ]; then
#  printf "T TEST SUCCESS\n"
#  ((success++))
#else
#  printf "T TEST FAILED\n"
#  printf "$compare"
#  ((failed++))
#fi
#
#((counter++))
#
## --number-nonblank TEST
#
#cat --number-nonblank test.txt>original
#gcc $PROG && ./s21_cat --number-nonblank test.txt>copy
#compare=$(diff original copy)
#
#if [ $? -eq 0 ]; then
#  printf "--number-nonblank TEST SUCCESS\n"
#  ((success++))
#else
#  printf "--number-nonblank TEST FAILED\n"
#  printf "$compare"
#  ((failed++))
#fi
#
#((counter++))
#
## ---number TEST
#
#cat --number test.txt>original
#gcc $PROG && ./s21_cat --number test.txt>copy
#compare=$(diff original copy)
#
#if [ $? -eq 0 ]; then
#  printf "--number TEST SUCCESS\n"
#  ((success++))
#else
#  printf "--number TEST FAILED\n"
#  printf "$compare"
#  ((failed++))
#fi
#
#((counter++))
#
## --squeeze-blank TEST
#
#cat --squeeze-blank test.txt>original
#gcc $PROG && ./s21_cat --squeeze-blank test.txt>copy
#compare=$(diff original copy)
#
#if [ $? -eq 0 ]; then
#  printf "---squeeze-blank TEST SUCCESS\n"
#  ((success++))
#else
#  printf "--squeeze-blank TEST FAILED\n"
#  printf "$compare"
#  ((failed++))
#fi
#
#((counter++))

printf "DONE $((success))\n"
printf "FAILED $((failed))\n"

rm a.out copy original