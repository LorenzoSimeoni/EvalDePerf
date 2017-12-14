#include "Tracage.h"


/*
	On récupère la matrice des flux grâce à cette fonction
*/
matrix MatriceDesFlux(matrix M,FILE* fichier){
	for(int i=0;i<26;i++){
		for(int j =0; j<26;j++){
			fscanf(fichier,"%d",&M.mat[i][j]);
		}
	}
}