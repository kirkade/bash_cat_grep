#include "s21_grep.h"
#include "getopt.h"

int main(int argc, char *argv[]) {
  char array_pattern[3000];
  struct grep_flags flags = {0};
  if (!parse(array_pattern, argc, argv, &flags) && argc > 2) {
    char arr[10000] = {'\0'};
    if (flags.e) {
      strcpy(arr, array_pattern);
    }
    if (!flags.e) {
      strcpy(arr, argv[optind++]);
    }
    for (int i = optind; i < argc; i++) {
      s21_grep(&flags, argv[i], arr, argc);
    }
  } else {
    fprintf(stderr, "some error\n");
  }
}

int parse(char *array_pattern, int argc, char *argv[],
          struct grep_flags *flags) {
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
      strcpy(array_pattern, optarg);
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

void s21_grep(struct grep_flags *flags, char *filename, char *arr, int argc) {
  reg_processing(flags, arr, filename, argc);
}

void reg_processing(struct grep_flags *flags, char *arr, char *filename,
                    int argc) {
  FILE *f;
  f = fopen(filename, "r");
  regex_t reg; // init struct from library, access to regcomp, regexec
  if (f != NULL) {
    regcomp(&reg, arr, flags->i ? REG_ICASE : REG_EXTENDED);
    file_processing(reg, filename, f, flags, argc);
    regfree(&reg);
  } else {
    if (!flags->s) {
      printf("no file ");
    }
  }
  fclose(f);
}

void file_processing(regex_t reg, char *filename, FILE *f,
                     struct grep_flags *flags, int argc) {
  char arr[10000];
  int count_flag_c = 0; // номер строки из файла
  int count_flag_n = 1; // кол-во совпадающих строк
  int multifiles = (argc - optind > 1);
  while (fgets(arr, 10000, f) != NULL) {

    regmatch_t pmatch[1]; // информация о расположении совпадений
    size_t nmatch = 1; // кол-во совпадений
    int exist = 0;
    int search = regexec(&reg, arr, nmatch, pmatch, 0);
    if (strchr(arr, '\n') == NULL)
      strcat(arr, "\n");
    if (search == 0 && !flags->v)
      exist = 1;
    if (search == REG_NOMATCH && flags->v)
      exist = 1;
    if (flags->n && exist && !flags->l && !flags->c) {
      if (multifiles) {
        printf("%s:", filename);
      }
      printf("%d:", count_flag_n);
    }
    if (flags->s && multifiles && exist)
      printf("%s:", filename);
    if (exist && !flags->o && !flags->l && !flags->c)
      printf("%s", arr);
    //    size_t len = strlen(arr);
    if (exist && flags->o) {
      //      for (int i = pmatch[0].rm_so; i < pmatch[0].rm_eo; i++) {
      //        snprintf(final_str + strlen(final_str), BUFSIZE -
      //        strlen(final_str),
      //                 "%c", cur_str[i]);
      //      }
      //      printf("%s\n", final_str);
      //
      //      cur_str = cur_str + matches[0].rm_eo;
    }

    count_flag_n++;
    if (exist) {
      count_flag_c++;
    }
  }

  if (flags->l) {
    if (count_flag_c == 0) {
      printf("%s:%d\n", filename, count_flag_c);
    } else if (count_flag_c > 0) {
      printf("%s\n", filename);
    }
  }
  if (flags->c && !flags->l) {
    printf("%d\n", count_flag_c);
  }
}