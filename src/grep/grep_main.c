#include "regex.h"
#include "stdio.h"
#include "string.h"
#include "unistd.h"

struct grep_flags {
  int e, i, v, c, l, n, h, s, f, o;
};

int parse(int argc, char *argv[], struct grep_flags *flags);
void s21_grep(char **argv, struct grep_flags *flags);
void reg_processing(struct grep_flags *flags, char *arr, char *filename);
void file_processing(regex_t reg, char *filename, FILE *f,
                     struct grep_flags *flags);

int main(int argc, char *argv[]) {
  //  char pattern[10000] = {'\0'};
  struct grep_flags flags = {0};
  if (!parse(argc, argv, &flags) && argc > 2) {
    for (; optind < argc; optind++) {
      s21_grep(argv, &flags);
    }
  } else {
    fprintf(stderr, "some error\n");
  }
}

int parse(int argc, char *argv[], struct grep_flags *flags) {
  int cur_flag;
  int exit = 0;
  char pattern[1000];
  char *shortopts = "e:ivclnhsf:o";

  while ((cur_flag = getopt(argc, argv, shortopts)) != -1) {
    switch (cur_flag) {
    case 'e':
      flags->e = 1;
      snprintf(pattern, 1000, "%s", optarg);
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

void s21_grep(char **argv, struct grep_flags *flags) {
  char arr[10000] = {'\0'};
  if (!flags->e) {
    snprintf(arr, 10000, "%s", argv[1]);
  }

  reg_processing(flags, arr, argv[optind]);
}

void reg_processing(struct grep_flags *flags, char *arr, char *filename) {
  FILE *f;
  f = fopen(filename, "r");
  regex_t reg; // init struct from library, access to regcomp, regexec
  if (f != NULL) {
    regcomp(&reg, arr, flags->i ? REG_EXTENDED | REG_ICASE : REG_EXTENDED);
    file_processing(reg, filename, f, flags);
    regfree(&reg);
  }
  fclose(f);
}

void file_processing(regex_t reg, char *filename, FILE *f,
                     struct grep_flags *flags) {
  char arr[10000] = {'\0'};
  regmatch_t pmatch[10]; // информация о расположении совпадений
  size_t nmatch = 1; // кол-во совпадений
  //  int count_flag_c = 0; // номер строки из файла
  int count_flag_n = 1; // кол-во совпадающих строк
  while (fgets(arr, 10000, f) != NULL) {
    int exist = 0;
    int search = regexec(&reg, arr, nmatch, pmatch, 0);
    if (search == 0 && !flags->v)
      exist = 1;
    if (search == REG_NOMATCH && flags->v)
      exist = 1;
    if (exist && flags->n)
      printf("%d:", count_flag_n);
    if (exist && !flags->l)
      printf("%s", arr);

    count_flag_n++;
  }
  if (flags->l)
    printf("%s\n", filename);
}