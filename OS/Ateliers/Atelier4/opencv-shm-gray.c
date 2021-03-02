/*================================================*/
/* exemple opencv  :                              */
/* (1) ouverture et affichage d'une               */
/* image prelablement chargee en memoire partagee */
/* (2) calcul de l'image en niveaux de gris "a la */
/* main"                                          */
/* (3) copie de l'image resultante dans une autre */
/* zone partagee                                  */
/*------------------------------------------------*/
/* Rq : la fonction de conversion d'une image     */
/* couleur en "niveaux de gris" existe de base    */
/* dans OpenCV et est bien plus efficace. Ce code */
/* est juste un exemple illustrant la maniere     */
/* d'utiliser l'organisation d'une image en       */
/* avec cette librairie.                          */
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
#define WND_NAME_IN        "RENDER_IN"                          /* ->nom de la fenetre de rendu OpenCV (image d'entree)  */
#define WND_NAME_OUT       "RENDER_OUT"                         /* ->nom de la fenetre de rendu OpenCV (image de sortie) */
#define WAIT_TIME       10                                      /* ->attente en ms de l'appui sur une touche */
/*..............*/
/* declarations */
/*..............*/
void usage( char *);                                               /* ->aide de ce programme                    */
IplImage *LinkIplImageFromSharedMemory( char *, void *, int * );   /* ->pour alleger le main()...               */
/*&&&&&&&&&&&&&&&&&&&&&&*/
/* aide de ce programme */
/*&&&&&&&&&&&&&&&&&&&&&&*/
void usage( char *szPgmName)
{
    printf("%s <nom de la zone partagee source> <nom de la zone partagee destination>\n", szPgmName);
    printf("convertit en niveaux de gris l'image de la zone source vers la zone destination \n");
}
/*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*/
/* on integre dans cette fonction l'initialisation d'une image */
/* DEPUIS une zone partagee                                    */
/*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*/
IplImage *LinkIplImageFromSharedMemory( char *szAreaName,           /* ->nom de la zone partagee                                  */
                                        void *lpvBaseAddr,          /* ->adresse de base de la zone                               */
                                        int  *lpiFd        )        /* ->pointeur vers le file descriptor correspondant a la zone */
{
    int         iSize;          /* ->taille effective de la zone a "mapper"                 */
    IplImage    *imgResult;     /* ->structure image resultante                             */
    char        *lpcBaseAddr;   /* ->pour avoir un pointeur "type" sur l'adresse de la zone */
    /* verification */
    if( szAreaName == NULL)
    {
        fprintf(stderr,"ERREUR : pointeur NULL passe a LinkIplImageFromSharedMemory() en tant qu'argument #1\n");
        return( NULL );
    };
    if( lpvBaseAddr == NULL)
    {
        fprintf(stderr,"ERREUR : pointeur NULL passe a LinkIplImageFromSharedMemory() en tant qu'argument #2\n");
        return( NULL );
    };
    if( lpiFd == NULL)
    {
        fprintf(stderr,"ERREUR : pointeur NULL passe a LinkIplImageFromSharedMemory() en tant qu'argument #3\n");
        return( NULL );
    };
    /* tentative d'ouverture de la zone */
    if( (*lpiFd = shm_open(szAreaName, O_RDWR , 0600)) < 0)
    {
        fprintf(stderr,"ERREUR : LinkIplImageFromSharedMemory() ---> appel a shm_open('%s',...)\n", szAreaName);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        return( NULL );
    };
    /* mapping (1) : on ne mappe que le debut pour recuperer la taille de l'image : */
    if( (lpvBaseAddr = mmap(NULL,sizeof(IplImage), PROT_READ | PROT_WRITE, MAP_SHARED, *lpiFd,0)) == NULL)
    {
        fprintf(stderr,"ERREUR : LinkIplImageFromSharedMemory() ---> appel a mmap() #1\n");
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( *lpiFd);
        return( NULL );
    };
    /* le debut de la zone partagee correspond a l'entete de la structure image OpenCV : */
    imgResult = (IplImage *)(lpvBaseAddr);
    /* d'ou la taille totale a mapper finalement : */
    iSize = sizeof(IplImage) + imgResult->width * imgResult->height * imgResult->nChannels;
    /* affichage des informations image : */
    printf("taille de l'image = %d x %d\n", imgResult->width, imgResult->height);
    /* on demappe */
    munmap( lpvBaseAddr, sizeof(IplImage));
    /* on remappe a la bonne taille : */
    if( (lpvBaseAddr = mmap(NULL,iSize, PROT_READ | PROT_WRITE, MAP_SHARED, *lpiFd,0)) == NULL)
    {
        fprintf(stderr,"ERREUR : LinkIplImageFromSharedMemory() ---> appel a mmap() #2\n");
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        close( *lpiFd);
        return( NULL );
    };
    imgResult = (IplImage *)(lpvBaseAddr);
    lpcBaseAddr = (char *)(lpvBaseAddr);
    /* on indique que les donnees image se trouvent a la suite de l'entete : */
    imgResult->imageData = (char *)(&lpcBaseAddr[sizeof(IplImage)]);
    /* OK */
    return(imgResult);
}
/*#####################*/
/* programme principal */
/*#####################*/
int main( int argc, char *argv[])
{
    int             i;                      /* ->compteur de boucles                              */
    int             j;                      /* ->compteur de boucles                              */
    int             iNbPixels;              /* ->nombre de pixels a traiter                       */
    int             iKey;                   /* ->code touche utilisateur                          */
    int             iShmFd;                 /* ->descripteur associe a la zone                    */
    int             iSize;                  /* ->taille de la zone partagee                       */
    int             iShmFdOut;              /* ->descripteur pour la zone image de sortie         */
    int             iSizeOut;               /* ->taille de la zone pour l'image de sortie         */ 
    double          dbTemp;                 /* ->calcul intermediaire                             */
    double          dbTemp2;                /* ->idem                                             */
    IplImage        *imgIn;                 /* ->header de l'image OpenCV                         */
    IplImage        *imgGray;               /* ->image en NIVEAUX DE GRIS                         */
    void            *lpvSharedArea;         /* ->pointeur sur la zone partagee source             */
    void            *lpvSharedAreaDest;     /* ->pointeur sur la zone partagee destination        */
    char            *lpcSharedAreaDest;     /* ->idem, mais type vers char                        */
    char            *lpcDestData;           /* ->pointeur sur les donnees image "niveaux de gris" */
    char            *lpcSrcData;            /* ->pointeur sur les donnees image "source"          */
    /* verification des arguments */
    if( argc != 3)
    {
        usage( argv[0]);
        return( 0 );
    };
    /* tentative d'initialisation de l'image source a partir de la zone partagee */
    if( (imgIn = LinkIplImageFromSharedMemory( argv[1], lpvSharedArea, &iShmFd)) == NULL)
    {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a LinkIplImageFromSharedMemory(%s,...)\n", argv[0], argv[1]);
        return( -1 );
    };
    /* affichage de l'image pour debug */
    cvNamedWindow( WND_NAME_IN,1 );
    /* affichage */
    do
    {
        cvShowImage( WND_NAME_IN, imgIn);
    } while ((iKey =cvWaitKey(WAIT_TIME)) != ' '); /* ->appui sur [ESPACE] pour quitter                           */
    /*...............................................................................................................*/
    /* CONVERSION DE L'IMAGE EN NIVEAUX DE GRIS : a savoir pour  :                                                   */
    /* (1) les donnees images sont pointees par la donnees membre imageData de la structure IplImage                 */
    /* (2) les lignes sont stockees les unes a la suite des autres                                                   */
    /* (3) pour une image couleur, chaque ligne est composee de la succession des triplets couleurs dans l'ordre GBR */
    /* (4) le nombre de pixels d'une ligne est indique dans la donnee membre width de la structure IplImage          */
    /* (5) le nombre de ligne est contenu dans la donnee membre height                                               */
    /* (6) le nombre de "canaux" (normalement 3 pour une image couleur) est stocke dans nChannels                    */
    /* exemple :                                                                                                     */
    /* on veut acceder a la valeur de la composante 'G' (vert) du pixel d'abscisse u et d'ordonnee v dans l'image et */
    /* img est le pointeur sur la structure IplImage contenant l'image :                                             */
    /* g = img->imageData[ (img->width * v + u) * img->nChannels ];                                                  */
    /* pour la composante bleue :                                                                                    */
    /* b = img->imageData[ (img->width * v + u) * img->nChannels + 1];                                               */
    /* et pour la composante rouge :                                                                                 */
    /* r = img->imageData[ (img->width * v + u) * img->nChannels  + 2];                                              */
    /* l'intensite en "niveaux de gris" pour le pixel de coordonnees (u,v) est simplement la norme euclidienne de    */
    /* son vecteur couleur (r,g,b). On ajoute ici un coefficient pour eviter la saturation (valeur max = 255).       */
    /*...............................................................................................................*/
    imgGray = cvCreateImage( cvSize(imgIn->width, imgIn->height), IPL_DEPTH_8U, 1); /* ->image MONO CANAL (niveaux de gris) */
    iNbPixels = imgIn->width * imgIn->height;
    for(i=0, lpcSrcData = imgIn->imageData, lpcDestData = imgGray->imageData; i < iNbPixels; lpcSrcData+= imgIn->nChannels, lpcDestData++, i++)
    {
        /* calcul de la norme euclidienne du vecteur couleur */
        dbTemp = 0.0;
        for(j=0; j < imgIn->nChannels; j++)
        {
            dbTemp2  = (double)((unsigned char)(lpcSrcData[j]));
            dbTemp+= dbTemp2 * dbTemp2;
        };
        dbTemp = sqrt( dbTemp) * 0.33333;
        if( dbTemp > 255.0)
        {
            dbTemp = 255.0;
        };
        lpcDestData[0] = (char)(dbTemp);    /* ->meme sens que *lpcDestData = (char)(dbTemp); */
    };
    /* affichage de l'image resultante en niveaux de gris */
     cvNamedWindow( WND_NAME_OUT,1 );
    /* affichage */
    do
    {
        cvShowImage( WND_NAME_OUT, imgGray);
    } while ((iKey =cvWaitKey(WAIT_TIME)) != ' '); /* ->appui sur [ESPACE] pour quitter                           */
    /*...............................................................................*/
    /* tentative de creation de la zone pour stockage de l'image en niveaux de gris  */
    /*...............................................................................*/
    if( (iShmFdOut = shm_open(argv[argc-1], O_RDWR | O_CREAT, 0600)) < 0)
    {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a shm_open('%s',...)\n", argv[0], argv[argc-1]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        goto end_point1;
    };
    /* ajustement de la taille de zone                                     */
    iSizeOut = sizeof( IplImage) + (imgGray->width * imgGray->height * imgGray->nChannels * sizeof(char));
    if( ftruncate( iShmFdOut, iSizeOut ) < 0 )
    {
        fprintf(stderr,"ERREUR : appel a ftruncate() depuis %s.main()\n", argv[0] );
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        goto end_point2;
    };
    /* mapping */
    if( (lpvSharedAreaDest = mmap(NULL,iSizeOut, PROT_READ | PROT_WRITE, MAP_SHARED, iShmFdOut,0)) == NULL)
    {
        fprintf(stderr,"ERREUR : %s.main() ---> appel a mmap()\n", argv[0]);
        fprintf(stderr,"code d'erreur = %d (%s)\n", errno, strerror(errno));
        goto end_point2;
    };
    /* au debut, on recopie l'entete, puis les donnees images a la suite : */
    memcpy( lpvSharedAreaDest, imgGray, sizeof(IplImage));
    lpcSharedAreaDest = (char *)(lpvSharedAreaDest);
    memcpy( &(lpcSharedAreaDest[sizeof (IplImage)]), imgGray->imageData, iSizeOut);
    /* on demappe */
    munmap( lpcSharedAreaDest, iSizeOut);
    munmap( lpvSharedArea, iSize);
    //cvReleaseImage( &imgIn);
end_point2:
    close( iShmFdOut);
end_point1:
    cvDestroyWindow( WND_NAME_IN);
    cvDestroyWindow( WND_NAME_OUT);
    close( iShmFd );
    cvReleaseImage( &imgGray);
    /* fin */
    return( 0 );
}
    