#include "stdio.h"
#include "unistd.h" 2

struct grep_flags {
  int e, i, v, c, l, n, h, s, f, o;
};

int parse(int argc, char* argv[], struct grep_flags* flags);

int main(int argc, char* argv[]) {
  struct grep_flags flags = {0};
  if (!parse(argc, argv, &flags)) {
    if (argc > 2) {
    } else {
        fprintf(stderr, "some error\n");
    }
  }
}

int parse(int argc, char* argv[], struct grep_flags* flags) {
  int cur_flag;
  int exit = 0;

  char* shortopts = "eivclnhsfo";

  while ((cur_flag = getopt(argc, argv, shortopts)) != -1) {
    switch (cur_flag) {
      case 'e':
        flags->e = 1;
        break;
      case 'i':
        flags->i = 1;
        break;
      case 'v':
        flags->v = 1;
        break;
      case 'c':
        flags->c = 1;
        break;
      case 'l':
        flags->l = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 'h':
        flags->h = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 'f':
        flags->f = 1;
        break;
      case 'o':
        flags->o = 1;
        break;
      default:
        exit = 1;
        break;
    }
  }
  if (exit) {
    fprintf(stderr, "illegal option\n");
  }
  return exit;
}