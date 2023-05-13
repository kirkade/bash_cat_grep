#!/bin/bash

PROG=s21_grep.c

counter=1
success=0
fail=0

# GREP TEST
grep a test.txt>original
gcc $PROG && ./s21_grep a test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -e a TEST
grep -e a test.txt>original
gcc $PROG && ./s21_grep -e a test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -e TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -e TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -i ASD TEST
grep -i ASD test.txt>original
gcc $PROG && ./s21_grep -i ASD test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -i ASD TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -i ASD TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -v asd TEST
grep -v asd test.txt>original
gcc $PROG && ./s21_grep -v asd test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -v asd TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -v asd TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -c a TEST
grep -c a test.txt>original
gcc $PROG && ./s21_grep -c a test.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -c a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -c a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -l a TEST
grep -l a test.txt test2.txt>original
gcc $PROG && ./s21_grep -l a test.txt test2.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -l a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -l a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -n a TEST
grep -n a test.txt test2.txt>original
gcc $PROG && ./s21_grep -n a test.txt test2.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -n a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -n a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -h a TEST
grep -h a test.txt test2.txt>original
gcc $PROG && ./s21_grep -h a test.txt test2.txt>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -h a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -h a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -s a TEST
grep -s a test.txt test2.tx>original
gcc $PROG && ./s21_grep -s a test.txt test2.tx>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -s a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -s a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))

# GREP -o a TEST
grep -o a test.txt test2.tx>original
gcc $PROG && ./s21_grep -o a test.txt test2.tx>copy
compare=$(diff original copy)

if [ $? -eq 0 ]; then
  printf "GREP -o a TEST SUCCESS\n"
  ((success++))
else
  printf "GREP -o a TEST FAILED\n"
  printf "$compare"
  ((failed++))
fi

((counter++))


printf "SUCCESS $((success))\n"
printf "FAILED $((failed))\n"

rm a.out copy original