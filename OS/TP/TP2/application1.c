#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h> /* ->cf open() */
#include <sys/stat.h> /* ->cf open() */
#include <sys/types.h> /* ->cf open() */

#define OUT_FILE_NAME "sortie.txt"
#define MAX_LEN 256 /* ->taille maximale pour une chaine */

int main(void) {
  int iOut; /* ->numero de canal */
  close(1);
  iOut = open(OUT_FILE_NAME, O_CREAT | O_RDWR);
  printf("ceci est un message.\n Est-il visible sur l'ecran de la console ?\n");

  return( 0 );
}