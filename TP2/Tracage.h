#include "listes.h"
#include "matrices.h"

/*
 Structure pour enregistrer toutes les données relatives au traçage d'un paquet
*/
typedef struct resultTracage resultTracage;

struct resultTracage
{
	int pid;
	char s[4];
	char d[4];
	int taille;
	int Debit;
	float tempsPourCalculerTaille;
	float TempsRouteursRencontres[26];
	float TAcheminementBoutEnBout;
	float TAttenteFiles;
	float TableauFilesAttentesTraversees[26];
	float TTransmissionLiens;
};

/*
 On récupère la matrice des flux dans une matrice grâce à cette fonction
*/
matrix MatriceDesFlux(matrix M,FILE* fichier);