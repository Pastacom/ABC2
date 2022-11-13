#include <stdio.h>
#include <string.h>

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

int main() {
  char str[max_size];
  int length = readString(str);
  if (length <= 1) {
    printf("Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n", length - 1, max_size-1);
    return 1;
  }
  transformString(str, length);
  return 0;
}
