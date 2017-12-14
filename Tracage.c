#include "Tracage.h"



matrix MatriceDesFlux(matrix M,FILE* fichier){
	for(int i=0;i<26;i++){
		for(int j =0; j<26;j++){
			fscanf(fichier,"%d",&M.mat[i][j]);
		}
	}
}