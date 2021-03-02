/*================================================*/
/* exemple opencv  : ouverture et affichage d'une */
/* image prelablement chargee en memoire partagee */
/*------------------------------------------------*/
/* Jacques BOONAERT AMSE 2021                     */
/*================================================*/
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>

#include "cv.h"
#include "highgui.h"

/*............*/
/* constantes */
/*............*/
#define WND_NAME        "RENDER2"       /* ->nom de la fenetre de rendu OpenCV       */
#define WAIT_TIME       10              /* ->attente en ms de l'appui sur une touche */

/*..............*/
/* declarations */
/*..............*/
void usage( char *);    /* ->aide de ce programme */

/*&&&&&&&&&&&&&&&&&&&&&&*/
/* aide de ce programme */
/*&&&&&&&&&&&&&&&&&&&&&&*/
void usage( char *szPgmName) {
    printf("%s <nom de la zone partagee>\n", szPgmName);
    printf("charge l'image a partir de la zone memoire de nom \n");
    printf("<nom de la zone partagee>\n");
}

/*#####################*/
/* programme principal */
/*#####################*/
int main( int argc, char *argv[]) {
    int         iKey;               /* ->code touche utilisateur       */
    int         iShmFd;             /* ->descripteur associe a la zone */
    int         iSize;              /* ->taille de la zone partagee    */ 
    IplImage    *imgIn;             /* ->header de l'image OpenCV      */
    char        *lpcSharedArea;     /* ->pointeur sur la zone partagee */

    /* verification des arguments */
    if( argc != 2) {
        usage( argv[0]);
        return( 0 );
    };

    /* tentative d'ouverture de la zone */
    if( (iShmFd = shm_open(argv[argc-1], O_RDWR , 0600)) < 0) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a shm_open('%s',...)\n", argv[0], argv[argc-1]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        return( -errno );
    };

    /* mapping (1) : on ne mappe que le debut pour recuperer la taille de l'image : */
    if( (lpcSharedArea = (char *)(mmap(NULL,sizeof(IplImage), PROT_READ | PROT_WRITE, MAP_SHARED, iShmFd,0))) == NULL) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a mmap() #1\n", argv[0]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( iShmFd);
        cvReleaseImage( &imgIn );
        return( -errno );
    };
    
    /* le debut de la zone partagee correspond a l'entete de la structure image OpenCV : */
    imgIn = (IplImage *)(lpcSharedArea);
    
    /* d'ou la taille totale a mapper finalement : */
    iSize = sizeof(IplImage) + imgIn->width * imgIn->height * imgIn->nChannels;
    
    /* affichage des informations image : */
    printf("taille de l'image = %d x %d\n", imgIn->width, imgIn->height);

    /* on demappe */
    munmap( lpcSharedArea, sizeof(IplImage));

    /* on remappe a la bonne taille : */
    if( (lpcSharedArea = (char *)(mmap(NULL,iSize, PROT_READ | PROT_WRITE, MAP_SHARED, iShmFd,0))) == NULL) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a mmap() #2\n", argv[0]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( iShmFd);
        cvReleaseImage( &imgIn );
        return( -errno );
    };

    imgIn = (IplImage *)(lpcSharedArea);

    /* on indique que les donnees image se trouvent a la suite de l'entete : */
    imgIn->imageData = (char *)(&lpcSharedArea[sizeof(IplImage)]);

    /* on affiche l'image */
    cvNamedWindow( WND_NAME,1 );

    /* affichage */
    do {
        cvShowImage( WND_NAME, imgIn);
    } while ((iKey =cvWaitKey(WAIT_TIME)) != ' '); /* ->appui sur [ESPACE] pour quitter */

    /* menage */
    cvDestroyWindow( WND_NAME);
    munmap( lpcSharedArea, iSize);
    //cvReleaseImage( &imgIn);
    close( iShmFd );

    /* fin */
    return( 0 );
}
    