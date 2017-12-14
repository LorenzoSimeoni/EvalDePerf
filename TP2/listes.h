#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/*
 première structure de liste la plu basique, si on a qu'une valeur à mettre dans une liste
*/
typedef struct element element;

struct element
{
    int val;
    struct element *nxt;
};

typedef element* llist;


/*
 Deuxième structure utile dans le programme pour enregistrer par exemple le pid et le t
*/
typedef struct element2 element2;

struct element2
{
    int val;
    float val2;
    struct element2 *nxt;
};

typedef element2* llist2;


llist ajouterEnTete(llist liste, int valeur);

llist ajouterEnFin(llist liste, int valeur);

llist supprimerElementEnTete(llist liste);

int rechercherElement(llist liste, int valeur);

void afficheElements(llist liste);

int nombreElements(llist liste);

void freeListe(llist l);

llist2 ajouterEnTete2(llist2 liste, int valeur, float valeur2);

llist2 ajouterEnFin2(llist2 liste, int valeur, float valeur2);

llist2 ajouterListeEnFin(llist2 liste1, llist2 liste2);

llist2 supprimerElementEnTete2(llist2 liste);

llist2 rechercherElement2(llist2 liste, int valeur, float *P,int k);

void afficheElements2(llist2 liste);

int nombreElements2(llist2 liste);

void freeListe2(llist2 l);

llist2 supprimerElement(llist2 list, int valeur,float *P,int k, float t);

llist2 supprimerElement2(llist2 list, int valeur,float *P,int k,float t,float *min,float *max);