#include "getopt.h"
#include "stdio.h"

struct cat_flags {
  int b, e, n, s, t, v;
};

int parse(int argc, char* argv[], struct cat_flags* flags);
void s21_cat(struct cat_flags* flags, char** argv);

int main(int argc, char* argv[]) {
  struct cat_flags flags = {0};
  if (!parse(argc, argv, &flags)) {
    for (int i = optind; i < argc; i++, optind++) {
      s21_cat(&flags, argv);
    }
  }

  return 0;
}

int parse(int argc, char* argv[], struct cat_flags* flags) {
  int cur_flag;
  int exit = 0;
  struct option longopts[] = {
      {"number-nonblank", 0, NULL, 'b'},
      {"number", 0, NULL, 'n'},
      {"squeeze-blank", 0, NULL, 's'},
      {0, 0, NULL, 0},
  };
  char* shortopts = "+benstvET";

  while ((cur_flag = getopt_long(argc, argv, shortopts, longopts, NULL)) !=
         -1) {
    switch (cur_flag) {
      case 'b':
        flags->b = 1;
        break;
      case 'e':
        flags->e = 1;
        flags->v = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 't':
        flags->t = 1;
        flags->v = 1;
        break;
      case 'v':
        flags->v = 1;
        break;
      default:
        exit = 1;
        break;
    }
    if (flags->n && flags->b) flags->n = 0;
  }
  if (exit) {
    fprintf(stderr, "illegal option \n");
  }
  return exit;
}

void s21_cat(struct cat_flags* flags, char** argv) {
  FILE* file;
  file = fopen(argv[optind], "r");
  if (file == NULL) {
    fprintf(stderr, "No such file or directory\n");
  } else {
    int count = 1;
    int blank_str = 0;
    int check = '\n';
    int c;
    while ((c = fgetc(file)) != EOF) {
      // flag s
      if (flags->s && c == '\n' && check == '\n') {
        blank_str++;
        if (blank_str >= 2) {
          continue;
        }
      } else {
        blank_str = 0;
      }
      // flag b and n
      if (check == '\n') {
        if (flags->n) {
          printf("%6d\t", count++);
        } else if (flags->b && c != '\n') {
          printf("%6d\t", count++);
        }
      }
      // flag e
      if (flags->e && c == '\n') {
        printf("$");
      }
      // flag v
      if (flags->v) {
        if ((c >= 0 && c < 9) || (c > 10 && c < 32) || (c > 126 && c <= 160)) {
          printf("^");
          if (c > 126) {
            c -= 64;
          } else {
            c += 64;
          }
        }
      }
      // flag t
      if (flags->t && c == '\t') {
        printf("^");
        c = 'I';
      }
      printf("%c", c);
      check = c;
    }
    fclose(file);
  }
}
