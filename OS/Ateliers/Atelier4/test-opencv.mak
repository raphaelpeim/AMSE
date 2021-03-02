# makefile pour compiler les applications OpenCV
CC=g++
# repertoire ou sont installees les librairies opencv
OPENCV_LIB_DIR=/usr/local/lib
# version d'OpenCV
CV_VERSION=2.4.13
# repertoire ou sont installes le headers opencv
OPENCV_INC_DIR=/usr/local/include/opencv
# repertoire source
SRCDIR=.
# repertoire de sortie ou construire le fichier executable 
OUTDIR=../bin
# repertoire ou stocker les fichiers relogeables (.o)
OBJDIR=../obj
# liste des librairies opencv utiles
OPENCV_LIBS = $(OPENCV_LIB_DIR)/libopencv_core.so $(OPENCV_LIB_DIR)/libopencv_highgui.so \
$(OPENCV_LIB_DIR)/libopencv_imgproc.so $(OPENCV_LIB_DIR)/libopencv_legacy.so  \
$(OPENCV_LIB_DIR)/libopencv_video.so
# options de compilation 
COPTS=-c -I$(OPENCV_INC_DIR)
# options pour l'edition des liens
LOPTS=-lm -lrt -pthread
# remplacer cette macro avec le nom du fichier source : 
TARGET=test-opencv

#regle de dependance et de production
$(OUTDIR)/$(TARGET) : $(OBJDIR)/$(TARGET).o 
	$(CC) $(OBJDIR)/$(TARGET).o $(OPENCV_LIBS) $(LOPTS) -o$(OUTDIR)/$(TARGET)

$(OBJDIR)/$(TARGET).o : $(SRCDIR)/$(TARGET).c
	$(CC) $(SRCDIR)/$(TARGET).c $(COPTS) -o$(OBJDIR)/$(TARGET).o


