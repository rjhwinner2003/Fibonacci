############################################################
############################################################
##                                                        ##
##                                                        ##
##                                                        ##
##                     Makefile                           ##
##                                                        ##
##      Written By:      Ryan Hall                        ##
##      System:      Silicon Graphics O2 - IRIX 6.5.22    ##
##      Compiler:    MIPSPro 7.4                          ##
##      Date:        July 19, '25                         ##
##      Description: Builds fibonacci.s.                  ##
##                                                        ##
##                                                        ##
##                                                        ##
############################################################
############################################################

CC = cc

LIBS = -lm

# source files and output

SRC = fibonacci.s
OBJ = fibonacci.o
OUT = fibonacci

$(OUT): $(OBJ)
	$(CC) -o $(OUT) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean: rm -f $(OBJ) $(OUT)
