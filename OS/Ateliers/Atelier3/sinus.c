#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

/* constante */
#define ANGULAR_STEP 0.01
#define WIDTH 2.0

int main(void) {
  int i; /* ->compteur de boucles */
  int iMaxIter; /* ->borne d'iteration */
  double dbAngle; /* ->valeur angulaire courante */
  
  /* initialisation */
  if (ANGULAR_STEP != 0.0) {
    iMaxIter = (int)(2.0 * WIDTH / ANGULAR_STEP);
  }
  else {
    return(0);
  }

  /* calcul effectif */
  for (int i = 0, dbAngle = 0.0; i < iMaxIter; i++, dbAngle += ANGULAR_STEP) {
    printf("sin(%lf) = %lf\n", dbAngle, sin(dbAngle));
  }

  return(0);
}