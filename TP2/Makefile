all: TP2.o Tracage.o listes.o matrices.o 
	gcc TP2.o -lm  listes.o matrices.o Tracage.o -o TP2

TP2.o: TP2.c Tracage.h 
	gcc -g -c TP2.c -lm -o TP2.o

matrices.o: matrices.c
	gcc -c matrices.c -o matrices.o

listes.o: listes.c
	gcc -c listes.c -o listes.o

Tracage.o: Tracage.c listes.h matrices.h
	gcc -c Tracage.c -o Tracage.o

# suppression des fichiers temporaires
clean:

	rm -rf *.o