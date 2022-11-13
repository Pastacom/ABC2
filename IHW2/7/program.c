#include <stdio.h>
#include "functions.h"

#define max_size 100001

int main(int argc, char **argv) {
  if (argc != 1 && argc != 3) {
    printf("Incorrect number of parameters.\n");
    return 1;
  }
  char str[max_size];
  int length;
  if (argc == 1) {
    length = readString(str);
  }
  if (argc == 3) {
    length = readStringFromFile(str, argv);
  }
  if (length <= 1) {
    printf("Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n", length - 1, max_size-1);
    return 1;
  }
  if (argc == 1) {
    transformString(str, length);
  }
  if (argc == 3) {
    printStringToFile(str, length, argv);
  }
  return 0;
}
