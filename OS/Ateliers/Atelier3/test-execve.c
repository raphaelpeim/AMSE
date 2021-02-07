#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <sys/types.h>

/* constantes */
#define NEW_PGM_NAME "../bin/sinus" /* ->adapter ce chemin a VOTRE environnement */
#define MAX_LEN 256 /* ->longueur maximale pour les chaines saisies */

/*#####################################################*/
/* programme principal : on attend la saisie d'une     */
/* chaine de caracteres pour effectuer le recouvrement */
/*#####################################################*/
int main(int argc, char *argv[]) {
  char szInString[MAX_LEN];
  
  printf("saisir une chaine pour faire l'appel execve()");
  scanf("%s", szInString);
  execve(NEW_PGM_NAME, argv, NULL);
  printf("ce message pourra-t-il s'afficher ???\n");
  return(0);
}