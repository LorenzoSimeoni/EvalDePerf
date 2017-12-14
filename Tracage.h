#include "listes.h"
#include "matrices.h"

typedef struct paquet paquet;

struct paquet
{
	double t;
	int code;
	int pid;
	int fid;
	int tos;
	int bif;
	char s[4];
	char d[4];
	char pos[4];
};

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

matrix MatriceDesFlux(matrix M,FILE* fichier);