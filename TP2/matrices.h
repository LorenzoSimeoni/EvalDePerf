#include <stdio.h>
#include <stdlib.h>

/*
 Structure de matrice, elle contient un double pointeur et 
 2 int permettant d'enregistrer la Hauteur et la Largeur de 
 la matrice, utiles pour les boucles for
*/
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