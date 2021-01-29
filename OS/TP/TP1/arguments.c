#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
  printf("Il y a %d arguments :\n", argc);

  for(int i = 0; i < argc; i++) {
    printf("Argument %d = %s\n", i, argv[i]);
  }

  return 0;
}