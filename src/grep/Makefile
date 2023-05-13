CC = gcc
FLAGS = -Wall -Wextra -Werror -fsanitize=address -g

all: s21_grep

s21_grep: s21_grep.c s21_grep.h
	$(CC) $(FLAGS) s21_grep.c -o s21_grep

clean:
	rm -rf s21_grep
	rm -rf *.dSYM

rebuild: clean all