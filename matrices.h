#include <stdio.h>
#include <stdlib.h>

typedef struct matrix matrix;

struct matrix{
	int ** mat;
	int Hauteur;
	int Largeur;
};

matrix alloueMatrice(int n,int m);

void afficheMatrice(matrix M);

void freeMatrice(matrix M);

matrix initMatrice(matrix M);