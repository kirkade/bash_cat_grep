CC = gcc
FLAGS = -Wall -Wextra -Werror -fsanitize=address  -g

all: s21_cat

s21_cat:
	$(CC) $(FLAGS) s21_cat.c -o s21_cat
	rm -rf *.dSYM

clean:
	rm -rf s21_cat

rebuild: clean all