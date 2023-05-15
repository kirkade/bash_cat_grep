#ifndef S21_GREP_H_
#define S21_GREP_H_

#include "getopt.h"
#include "regex.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "unistd.h"

struct grep_flags {
  int e, i, v, c, l, n, h, s, f, o;
};

int parse(char *array_pattern, int argc, char *argv[], struct grep_flags *flags,
          char *filename);
void s21_grep(struct grep_flags *flags, char *filename, char *arr,
              int multifiles);
void searching(regex_t reg, char *filename, FILE *f, struct grep_flags *flags,
               int multifiles);
void flag_o(int multifiles, char *filename, char *arr, regmatch_t *pmatch,
            size_t nmatch, regex_t *reg, struct grep_flags *flags);
void flag_f(char *arr, char *filename);

#endif