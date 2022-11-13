#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <time.h>

#define max_size 100001

int main(int argc, char **argv) {
  if (argc < 1 || argc > 3) {
    printf("Incorrect number of parameters.\n");
    return 1;
  }
  char str[max_size];
  int length;
  if (argc == 1) {
    length = readString(str);
  }
  if (argc == 2) {
    length = generateString(str);
  }
  if (argc == 3) {
    length = readStringFromFile(str, argv);
  }
  if (length <= 1) {
    printf("Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n", length - 1, max_size-1);
    return 1;
  }
  clock_t start = clock();
  if (argc == 1 || argc == 2) {
    transformString(str, length);
  }
  if (argc == 3) {
    printStringToFile(str, length, argv);
  }
  clock_t stop = clock();
  double elapsed_time = (double)(stop - start) / CLOCKS_PER_SEC;
  printf("Elapsed time: %f\n", elapsed_time);
  return 0;
}
