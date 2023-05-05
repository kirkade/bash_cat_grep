CC = gcc
FLAGS = -Wall -Wextra -Werror -fsanitize=address  -g

all: s21_cat

s21_cat:
	$(CC) $(FLAGS) main.c -o s21_cat

clean:
	rm -rf s21_cat

rebuild: clean all