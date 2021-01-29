#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
  int sum = 0;
  double x;

  if (argc > 1) {
    for(int i = 1; i < argc; i++) {
      if (sscanf(argv[i], "%lf", &x)) {
        sum += x;
      }
      else {
        printf("Veuillez n'entrer que des entiers");
        exit(0);
      }
    }

    printf("La somme de ces entiers vaut : %d\n", sum);
  }
  else {
    printf("Veuillez entrer au moins un entier\n");
  }
  return 0;
}