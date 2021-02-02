#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <string.h>
#include <math.h>

void usage(char *); /* ->aide de ce programme */

void usage( char *szPgmName) {
    if (szPgmName == NULL) {
        exit( -1 ); /* ->ca va mal... */
    }

    printf("%s <gain statique> <constante de temps> <periode d'ech.>\n", szPgmName);
    printf("saisir STOP (ou qq chose qui n'est pas un nombre) stoppe le programme\n");
}

/*##############################################################*/
/* programme principal : on passe en argument et dans cet ordre */
/* - le gain statique K                                         */
/* - la constante de temps tau (s)                              */
/* - la periode d'echantillonnage Te (s)                        */
/*##############################################################*/
int main(int argc, char *argv[]) {
  double k; /* ->gain statique */
  double tau; /* ->constante de temps */
  double Te; /* ->periode d'echantillonnage */
  double z0; /* ->pole discret (pour la recurrence) */
  double y; /* ->sortie "courante" (instant k) */
  double y1; /* ->sortie precedente (instant k-1) */
  double u; /* ->entree courante (saisie utilisateur) */
  
  if(argc != 4) {
    usage(argv[0]);
    return(0);
  }

  /*................................................................*/
  /* Recuperation des arguments (un par un en verifiant le format). */
  /* En cas d'erreur, un message s'affiche sur la sortie d'ERREUR */
  /* et l'aide s'affiche sur la sortie standard : */
  if( sscanf(argv[1], "%lf", &k)== 0 )
    {
        fprintf(stderr,"%s : erreur de format (le premier argument doit etre un reel\n", argv[0]);
        usage( argv[0]);
        return(0);
    };
    if( sscanf(argv[2], "%lf", &tau)== 0 )
    {
        fprintf(stderr,"%s : erreur de format (le second argument doit etre un reel\n", argv[0]);
        usage( argv[0]);
        return(0);
    };
    if( sscanf(argv[3], "%lf", &Te)== 0 )
    {
        fprintf(stderr,"%s : erreur de format (le troisieme argument doit etre un reel\n", argv[0]);
        usage( argv[0]);
        return(0);
    };

  /*................................................................*/
  /*...............................................*/
  /* initialisations : */
  /* -poles discret */
  /* -y1 (a 0.0) */
  /* -nettoyage buffer d'entree : fflush( stdin ) */
  /*...............................................*/
  z0 = exp(-Te / tau);
  y1 = 0.0;

  /*....................*/
  /* boucle de saisie : */
  /*....................*/
  do {
    /* saisie de la chaine utilisateur */
    /* (sortie si format incorrect)    */
    fflush( stdin );
    if (scanf("%lf",&u) == 0) {
        break;
    }
    /* calcul de la sortie courante: */
    y = z0*y1 + k*(1.0 - z0)*u;

    /* on decale pour le tour suivant : */
    y1 = y;

    /* affichage de la sortie courante : */
    printf("%lf\n", y);
    fflush( stdout );   /* ->forcage de l'affichage */
  } while (1);
  
  printf("STOP\n");
  
  return(0);
}