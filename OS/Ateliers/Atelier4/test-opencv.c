/*================================================*/
/* exemple opencv  : ouverture et affichage d'une */
/* image                                          */
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
#define WND_NAME        "RENDERING"     /* ->nom de la fenetre de rendu OpenCV */
#define WAIT_TIME       20              /* ->duree d'attente cvWaitKey (ms)    */

/*..............*/
/* declarations */
/*..............*/
void usage( char *);    /* ->aide de ce programme */

/*&&&&&&&&&&&&&&&&&&&&&&*/
/* aide de ce programme */
/*&&&&&&&&&&&&&&&&&&&&&&*/
void usage( char *szPgmName) {
    printf("%s <nom de l'image> <nom de la zone partagee>\n", szPgmName);
    printf("charge l'image de nom <nom de l'image> dans la zone memoire de nom \n");
    printf("<nom de la zone partagee>\n");
}

/*#####################*/
/* programme principal */
/*#####################*/
int main( int argc, char *argv[]) {
    int         iKey;               /* ->code touche utilisateur           */
    int         iShmFd;             /* ->descripteur associe a la zone     */
    int         iSize;              /* ->taille de la zone partagee        */ 
    IplImage    *imgIn;             /* ->image lue depuis le fichier       */
    IplImage    *imgInHeader;       /* ->header copie sur la zone partagee */
    char        *lpcSharedArea;     /* ->pointeur sur la zone partagee     */

    /* verification des arguments */
    if( argc != 3) {
        usage( argv[0]);
        return( 0 );
    };

    /* tentative de creation de la zone */
    if( (iShmFd = shm_open(argv[argc-1], O_RDWR | O_CREAT, 0600)) < 0) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a shm_open('%s',...)\n", argv[0], argv[argc-1]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        return( -errno );
    };

    /* tentative de lecture des donnees images                             */
    if( (imgIn = cvLoadImage(argv[1],1)) == NULL ) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a cvLoadImage('%s',1)\n", argv[0], argv[1]);
        close( iShmFd);
        return( -1 );
    };

    /* ajustement de la taille de zone                                     */
    iSize = sizeof( IplImage) + (imgIn->width * imgIn->height * imgIn->nChannels * sizeof(char));
    if( ftruncate( iShmFd, iSize ) < 0 ) {
        fprintf(stderr,"ERREUR : appel a ftruncate() depuis %s.main()\n", argv[0] );
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( iShmFd);
        cvReleaseImage( &imgIn );
        return( -errno );
    };

    /* mapping */
    if( (lpcSharedArea = (char *)(mmap(NULL,iSize, PROT_READ | PROT_WRITE, MAP_SHARED, iShmFd,0))) == NULL) {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a mmap()\n", argv[0]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( iShmFd);
        cvReleaseImage( &imgIn );
        return( -errno );
    }
    imgInHeader = (IplImage *)(lpcSharedArea);
    /* au debut, on recopie l'entete, puis les donnees images a la suite : */
    memcpy( lpcSharedArea, imgIn, sizeof(IplImage));
    memcpy( &(lpcSharedArea[sizeof (IplImage)]), imgIn->imageData, iSize);
    imgInHeader->imageData = &(lpcSharedArea[sizeof (IplImage)]);
    /* creation de la fenetre de rendu OpenCV : */
    cvNamedWindow( WND_NAME,1 );
    /* affichage */
    do {
        cvShowImage( WND_NAME, imgIn);
    } while ((iKey = cvWaitKey(WAIT_TIME)) != ' '); /* ->appui sur [ESPACE] pour quitter */

    /* menage */
    cvDestroyWindow( WND_NAME);
    cvReleaseImage( &imgIn);
    close( iShmFd );
    
    /* fin */
    return( 0 );
}
    