#include <stdio.h>
#include <stdlib.h>
#include <string.h> /* ->manipulation des chaines de caracteres */
#include <unistd.h> /* ->pour prototypes des fonctions read(), etc. sous linux */

#define MESSAGE "Bonjour!!!\n"
#define MAX_LEN 256 /* ->longueur maximale d'une chaine */

int main( void ) {
  char *szOutMessage = MESSAGE; /* ->a utiliser avec precaution... */
  char szInString[MAX_LEN]; /* ->pour la saisie d'une chaine */
  int n; /* ->longueur de la chaine a imprimer */
  int iNbBytes; /* ->nombre d'octets saisis */
  double dbValeur; /* ->valeur reelle saisie */

  /* affichage : */
  n = strlen(MESSAGE);
  write(1, szOutMessage, n);

  /* saisie (chaine): */
  fflush(stdin); /* ->nettoyage canal d'entree avant saisie */
  memset(szInString, 0, MAX_LEN);
  iNbBytes = read(0, szInString, MAX_LEN);
  printf("%d octets saisis \n", iNbBytes);

  /* tentative de conversion de la chaine saisie en un reel : */
  if (sscanf(szInString, "%lf", &dbValeur) == 1) {
    printf("valeur saisie = %lf\n", dbValeur);
  }
  else {
    printf("la chaine %s ne correspond pas a un reel\n", szInString);
  }

  return(0);
}