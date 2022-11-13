#include <stdio.h>

#define max_size 100001

int readString(char str[]) {
  printf("Input text: ");
  int length = 0;
  int ch;
  do {
    ch = fgetc(stdin);
    str[length++] = ch;
    if (length == max_size) {
        printf("Buffer overflow occured. Trimming your text.");
    }
  } while(ch != -1);
  str[length-1] = '\0';
  return length;
}

void transformString(char str[], int length) {
  char lowerChars[] = "aeiouy";
  for (int i = 0; i < length; ++i) {
    for (int j = 0; j < 6; ++j) {
      if (str[i] == lowerChars[j]) {
        str[i] = str[i] - 32;
      }
    }
  }
  printf("Result: %s\n", str);
}

int readStringFromFile(char str[], char **argv) {
  int length = 0;
  int ch;
  FILE *file = fopen(argv[1], "r");
  do {
    ch = fgetc(file);
    str[length++] = ch;
    if (length == max_size) {
        printf("Buffer overflow occured. Trimming your text.");
    }
  } while(ch != -1);
  str[length-1] = '\0';
  fclose(file);
  printf("End up reading file.\n");
  return length;
}

void printStringToFile(char str[], int length, char **argv) {
  char lowerChars[] = "aeiouy";
  for (int i = 0; i < length; ++i) {
    for (int j = 0; j < 6; ++j) {
      if (str[i] == lowerChars[j]) {
        str[i] = str[i] - 32;
      }
    }
  }
  FILE *file = fopen(argv[2], "w+");
  fprintf(file, "Result: %s\n", str);
  fclose(file);
  printf("Result is in the output file.\n");
}
