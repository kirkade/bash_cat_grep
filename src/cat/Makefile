CC = gcc
FLAGS = -Wall -Wextra -Werror -g

all: s21_cat

s21_cat: s21_cat.c s21_cat.h
	$(CC) $(FLAGS) s21_cat.c -o s21_cat
	rm -rf *.dSYM

clean:
	rm -rf s21_cat

rebuild: clean all