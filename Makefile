MF=     Makefile
 
CC=     g++
 
CFLAGS= -g -fopenmp -D_USE_OMP -msse4.2 -O3 -fomit-frame-pointer -funroll-loops  
 
# Specify the path to the Boost include directory
BOOST_INCLUDE_DIR = $(CONDA_PREFIX)/include

LFLAGS= -std=c++11 -I ./ -I $(BOOST_INCLUDE_DIR)
 
EXE=    cnef
 
SRC=    cnef.cc extend.cc utils.cc qgrams.cc overlaps.cc edlib.cc
 
HD=     cnef.h qgrams.h file.h qlist.h Makefile
 
# 
# No need to edit below this line 
# 
 
.SUFFIXES: 
.SUFFIXES: .cc .o 
 
OBJ=    $(SRC:.cc=.o) 
 
.cc.o: 
	$(CC) $(CFLAGS) -c $(LFLAGS) $< 
 
all:    $(EXE) 
 
$(EXE): $(OBJ) 
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LFLAGS) 
 
$(OBJ): $(MF) $(HD) 
 
clean: 
	rm -f $(OBJ) $(EXE) *~

clean-all: 
	rm -f $(OBJ) $(EXE) *~
	rm -r libsdsl
	rm -r sdsl-lite
