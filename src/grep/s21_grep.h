#ifndef S21_GREP_H_
#define S21_GREP_H_

#include "regex.h"
#include "stdio.h"
#include "string.h"
#include "unistd.h"

struct grep_flags {
  int e, i, v, c, l, n, h, s, f, o;
};

int parse(char *array_pattern, int argc, char *argv[],
          struct grep_flags *flags);
void s21_grep(struct grep_flags *flags, char *filename, char *arr, int argc);
void reg_processing(struct grep_flags *flags, char *arr, char *filename,
                    int argc);
void file_processing(regex_t reg, char *filename, FILE *f,
                     struct grep_flags *flags, int argc);

#endif