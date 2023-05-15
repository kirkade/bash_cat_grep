#ifndef S21_CAT_H_
#define S21_CAT_H_

#include "getopt.h"
#include "stdio.h"

struct cat_flags {
  int b, e, n, s, t, v;
};

int parse(int argc, char *argv[], struct cat_flags *flags);
void s21_cat(struct cat_flags *flags, char **argv);

#endif