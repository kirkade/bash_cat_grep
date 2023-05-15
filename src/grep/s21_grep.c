#include "s21_grep.h"

int main(int argc, char *argv[]) {
  char *array_pattern = calloc(3000, sizeof(char));
  struct grep_flags flags = {0};
  char *filename = calloc(3000, sizeof(char));
  if (!parse(array_pattern, argc, argv, &flags, filename) && argc > 2) {
    char *arr = calloc(3000, sizeof(char));
    if (flags.e && !flags.f) {
      strcpy(arr, array_pattern);
    }
    if (flags.f) {
      flag_f(arr, filename);
    }
    if (!flags.e && !flags.f) {
      strcpy(arr, argv[optind++]);
    }
    for (int i = optind; i < argc; i++) {
      int multifiles = (argc - optind > 1);
      s21_grep(&flags, argv[i], arr, multifiles);
    }
    free(arr);
  } else {
    fprintf(stderr, "some error\n");
  }
  free(array_pattern);
  free(filename);
  return 0;
}

int parse(char *array_pattern, int argc, char *argv[], struct grep_flags *flags,
          char *filename) {
  int cur_flag;
  int exit = 0;
  char *shortopts = "e:ivclnhsf:o";
  struct option longopts[] = {
      {0, 0, NULL, 0},
  };
  while ((cur_flag = getopt_long(argc, argv, shortopts, longopts, NULL)) !=
         -1) {
    switch (cur_flag) {
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
      case 'o':
        flags->o = 1;
        break;
      case 'e':
        flags->e = 1;
        strcpy(array_pattern, optarg);
        break;
      case 'f':
        flags->f = 1;
        strcpy(filename, optarg);
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

void s21_grep(struct grep_flags *flags, char *filename, char *arr,
              int multifiles) {
  FILE *f;
  f = fopen(filename, "r");
  regex_t reg;
  if (f != NULL) {
    regcomp(&reg, arr, flags->i ? REG_ICASE : REG_EXTENDED);
    searching(reg, filename, f, flags, multifiles);
    regfree(&reg);
  } else {
    if (!flags->s) {
      fprintf(stderr, "something wrong with file\n");
    }
  }
  fclose(f);
}

void searching(regex_t reg, char *filename, FILE *f, struct grep_flags *flags,
               int multifiles) {
  char *arr = calloc(3000, sizeof(char));
  int count_flag_c = 0;  // номер строки из файла
  int count_flag_n = 1;  // кол-во совпадающих строк
  while (fgets(arr, 10000, f) != NULL) {
    regmatch_t pmatch;  // информация о расположении совпадений
    size_t nmatch = 1;  // кол-во совпадений
    int exist = 0;
    int search = regexec(&reg, arr, nmatch, &pmatch, 0);
    size_t len = strlen(arr);
    if (search == 0 && !flags->v) exist = 1;
    if (search == REG_NOMATCH && flags->v) exist = 1;
    if (arr[len - 1] != '\n') strcat(arr, "\n");
    if (multifiles && !flags->h && exist && !flags->c && !flags->l &&
        !flags->o) {
      printf("%s:", filename);
    }
    if (flags->n && exist && !flags->c) {
      printf("%d:", count_flag_n);
    }
    if (exist && !flags->l && !flags->o && !flags->c) printf("%s", arr);
    if (flags->o && exist && !flags->l && !flags->c && !flags->n) {
      flag_o(multifiles, filename, arr, &pmatch, nmatch, &reg, flags);
    }
    count_flag_n++;
    if (exist) {
      count_flag_c++;
    }
  }
  if (flags->c && multifiles) {
    printf("%s:", filename);
  }
  if (flags->l && count_flag_c > 0) {
    printf("%s\n", filename);
  }
  if (flags->c && !flags->l) {
    printf("%d\n", count_flag_c);
  }
  if (flags->c && flags->l) {
    printf("%s:%d\n", filename, count_flag_c);
  }
  free(arr);
}

void flag_o(int multifiles, char *filename, char *arr, regmatch_t *pmatch,
            size_t nmatch, regex_t *reg, struct grep_flags *flags) {
  if (multifiles && !flags->h) {
    printf("%s:", filename);
  }
  printf("%.*s", (int)(pmatch->rm_eo - pmatch->rm_so), arr + pmatch->rm_so);
  char *shift = arr + pmatch->rm_eo;
  printf("\n");

  while (regexec(reg, shift, nmatch, pmatch, 0) == 0) {
    if (multifiles && !flags->h) {
      printf("%s:", filename);
    }
    printf("%.*s", (int)(pmatch->rm_eo - pmatch->rm_so), shift + pmatch->rm_so);
    shift = shift + pmatch->rm_eo;
    printf("\n");
  }
}

void flag_f(char *arr, char *filename) {
  FILE *f;
  f = fopen(filename, "r");
  int i = 0;
  if (f == NULL) {
    printf("something wrong with file\n");
  } else {
    int c;
    while ((c = fgetc(f)) != EOF) {
      if (c != '\n') arr[i++] = c;
      if (c == '\n') arr[i++] = '|';
    }
    if (arr[i - 1] == '|') arr[i - 1] = '\0';
  }
  fclose(f);
}
