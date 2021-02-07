#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h> /* ->recuperation des codes d'erreur */
#include <sys/types.h>
#include <sys/wait.h>

int main(void) {
  pid_t id_fils, /* ->Process ID du processus fils */
        id;

  char rep; /* ->saisie utilisateur */
  int status; /* ->"exit status" du fils */
  
  /* lancement du processus fils */
  id_fils = fork(); /* ->creation d'une copie du processus en cours */

  /* est-ce que ca a marche ? */
  if((int) (id_fils) < 0) {
    /* ECHEC */
    fprintf(stderr,"ERREUR : main() ---> appel a fork().\n");
    fprintf(stderr," code d'erreur = %d (%s)\n", errno,(char *)(strerror(errno)) );
    exit(errno);
  }

  /* fils ? */
  if((int) (id_fils) == 0) {
    printf("FILS:je suis le processus fils de PID %d\n", getpid());
    printf("FILS:mon pere a le PID %d\n", getppid());
    printf("FILS:saisir un caractere + [ENTREE] pour finir...\n");
    fflush(stdin);
    scanf("%c", &rep);
    return(0);
  }

  /* pere ? */
  if((int) (id_fils) > 0) {
    printf("PERE: je suis le processus pere de PID %d\n", getpid());
    printf("PERE: mon fils a le PID %d\n", (int)(id_fils));
    printf("PERE: mon pere a le PID %d\n", getppid());
    /*..........................................................*/
    /* FAIRE UN ESSAI EN SUPPRIMANT CETTE LIGNE (id = wait(.. ) */
    /* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    id = wait( &status );
    printf("PERE: Le processus fils %d s'est termine.\n", (int)(id));
    printf("PERE: avec le status de sortie = %d\n", status );
  }
  
  return(0);
}