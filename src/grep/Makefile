
all: s21_grep

s21_grep: s21_grep.c s21_grep.h
	gcc -g -Wall -Werror -Wextra -std=c11 -o s21_grep s21_grep.c
	rm -rf *.dSYM

clean:
	rm -rf s21_grep
	rm -rf *.dSYM

rebuild: clean all