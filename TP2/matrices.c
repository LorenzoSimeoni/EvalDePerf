#include "matrices.h"

/*
 Fonction basique pour allouer une matrice aux dimensions souhaitées
*/
matrix alloueMatrice(int n, int m) {
	int i;
	matrix res;
	res.Hauteur=n;
	res.Largeur=m;
	res.mat=malloc(n*sizeof(int*));
	for(i=0;i<n;i++) {
		res.mat[i]=malloc(m*sizeof(int));
	}
	return res;
}

/*
  Permet d'afficher une matrice peut importe ses dimensions
*/
void afficheMatrice(matrix M) {
	int i;
	int j;
	for(i=0; i<M.Hauteur; i++) {
		printf("(");
		for(j=0; j<M.Largeur; j++) {
			printf("%d",M.mat[i][j]);
			printf("  ");
		}
		printf(")\n");
	}
}

/*
 Permet de free toutes les allocations pour empêcher les fuites mémoires
*/
void freeMatrice(matrix M){
	for(int i=0;i<M.Hauteur;i++) {
		free(M.mat[i]);
	}
	free(M.mat);
}

/*
  initialise une matrice de n'importe quelle taille
*/
matrix initMatrice(matrix M) {
	for(int i=0;i<M.Hauteur;i++){
		for(int j=0;j<M.Largeur;j++){
			M.mat[i][j]=0;
		}
	}
	return M;
}