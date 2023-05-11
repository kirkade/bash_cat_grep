CC = gcc
FLAGS = -Wall -Wextra -Werror -fsanitize=address -g

all: s21_grep

s21_grep:
	$(CC) $(FLAGS) grep_main.c -o s21_grep
	rm -rf *.dSYM ../../*.dSYM

clean:
	rm -rf s21_grep

rebuild: clean all