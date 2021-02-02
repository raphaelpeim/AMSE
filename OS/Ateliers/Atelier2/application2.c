#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#define IN_FILE_NAME "texte.txt"
#define MAX_LEN 256 /* ->taille maximale pour une chaine */

int main(void) {
  int iIn; /* ->canal d'entree */
  char szInStr[MAX_LEN];
  close(0);
  iIn = open(IN_FILE_NAME, O_RDONLY);

  do {
    /*saisie clavier */
    scanf("%s", szInStr);
    /* affichage saisie clavier */
    printf("%s\n", szInStr);
  } while(strcmp(szInStr, "STOP") != 0 ); /* arret si STOP saisi */

  return(0);
}