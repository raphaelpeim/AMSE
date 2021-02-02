#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  printf("ceci est un message affiche sur stdout\n");
  fprintf(stderr, "ceci est un message affiche sur stderr\n");

  return(0);
}