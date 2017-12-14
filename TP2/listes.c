#include "listes.h"



llist ajouterEnTete(llist liste, int valeur)
{
    /* On crée un nouvel élément */
    element* nouvelElement = malloc(sizeof(element));
    /* On assigne la valeur au nouvel élément */
    nouvelElement->val = valeur;
    /* On assigne l'adresse de l'élément suivant au nouvel élément */
    nouvelElement->nxt = liste;
    /* On retourne la nouvelle liste, i.e. le pointeur sur le premier élément */
    return nouvelElement;
}

llist ajouterEnFin(llist liste, int valeur)
{
    /* On crée un nouvel élément */
    element* nouvelElement = malloc(sizeof(element));
    /* On assigne la valeur au nouvel élément */
    nouvelElement->val = valeur; 
    /* On ajoute en fin, donc aucun élément ne va suivre */
    nouvelElement->nxt = NULL;

    if(liste == NULL)
    {
        /* Si la liste est videé il suffit de renvoyer l'élément créé */
        return nouvelElement;
    }
    else
    {
        /* Sinon, on parcourt la liste à l'aide d'un pointeur temporaire et on
        indique que le dernier élément de la liste est relié au nouvel élément */
        element* temp=liste;
        while(temp->nxt != NULL)
        {
            temp = temp->nxt;
        }
        temp->nxt = nouvelElement;
        return liste;
    }
}

llist supprimerElementEnTete(llist liste)
{
    if(liste != NULL)
    {
        /* Si la liste est non vide, on se prépare à renvoyer l'adresse de
        l'élément en 2ème position */
        element* aRenvoyer = liste->nxt;
        /* On libère le premier élément */
        free(liste);
        /* On retourne le nouveau début de la liste */
        return aRenvoyer;
    }
    else
    {
        return NULL;
    }
}

int rechercherElement(llist liste, int valeur)
{
    element *tmp=liste;
    /* Tant que l'on n'est pas au bout de la liste */
    while(tmp != NULL)
    {
        if(tmp->val == valeur)
        {
            /* Si l'élément a la valeur recherchée, on renvoie son adresse */
            return 1;
        }
        tmp = tmp->nxt;
    }
    return 0;
}

void afficheElements(llist liste){

    if(liste== NULL){
        printf("liste vide");
    }
    else{
        llist res;
        res = liste;
        while(res != NULL) {
            printf("%d\n",res->val);
            res = res->nxt;
        }
    }
}

int nombreElements(llist liste)
{
    /* Si la liste est vide, il y a 0 élément */
    if(liste == NULL)
        return 0;
    /* Sinon, il y a un élément (celui que l'on est en train de traiter)
    plus le nombre d'éléments contenus dans le reste de la liste */
    return nombreElements(liste->nxt)+1;
}

void freeListe(llist l){
    llist temp;
    while (l!=NULL) {
        temp=l->nxt;
        free(l);
        l=temp;
    }
}

llist2 ajouterEnTete2(llist2 liste, int valeur, float valeur2)
{
    /* On crée un nouvel élément */
    element2* nouvelElement = malloc(sizeof(element2));
    /* On assigne la valeur au nouvel élément */
    nouvelElement->val = valeur;
    nouvelElement->val2 = valeur2;
    /* On assigne l'adresse de l'élément suivant au nouvel élément */
    nouvelElement->nxt = liste;
    /* On retourne la nouvelle liste, i.e. le pointeur sur le premier élément */
    return nouvelElement;
}

llist2 ajouterEnFin2(llist2 liste, int valeur, float valeur2)
{
    /* On crée un nouvel élément */
    element2* nouvelElement = malloc(sizeof(element2));
    /* On assigne la valeur au nouvel élément */
    nouvelElement->val = valeur;
    nouvelElement->val2 = valeur2; 
    /* On ajoute en fin, donc aucun élément ne va suivre */
    nouvelElement->nxt = NULL;

    if(liste == NULL)
    {
        /* Si la liste est videé il suffit de renvoyer l'élément créé */
        return nouvelElement;
    }
    else
    {
        /* Sinon, on parcourt la liste à l'aide d'un pointeur temporaire et on
        indique que le dernier élément de la liste est relié au nouvel élément */
        element2* temp=liste;
        while(temp->nxt != NULL)
        {
            temp = temp->nxt;
        }
        temp->nxt = nouvelElement;
        return liste;
    }
}

llist2 ajouterListeEnFin(llist2 liste1, llist2 liste2) {
    if(liste1==NULL){
        return liste2;
    }
    else{
        element2* temp=liste1;
        while(temp->nxt != NULL)
        {
            temp = temp->nxt;
        }
        temp->nxt = liste2;
        return liste1;
    }

}

llist2 supprimerElementEnTete2(llist2 liste)
{
    if(liste != NULL)
    {
        /* Si la liste est non vide, on se prépare à renvoyer l'adresse de
        l'élément en 2ème position */
        element2* aRenvoyer = liste->nxt;
        /* On libère le premier élément */
        free(liste);
        /* On retourne le nouveau début de la liste */
        return aRenvoyer;
    }
    else
    {
        return NULL;
    }
}

//Cette fonction était mon premier test de supprime Element
llist2 rechercherElement2(llist2 liste, int valeur, float *P,int k)
{
    int compteur = 0;
    int compteur2 = 0;
    element2 *tmp=liste;
    element2 *tmp2=liste;
    /* Tant que l'on n'est pas au bout de la liste */
    while(tmp != NULL)
    {     
        if(tmp->val == valeur)
        {
            if(k==3) {
                *P= *P + tmp->val2;                
            }
            if(compteur == 0){
                tmp = supprimerElementEnTete2(tmp);
                return liste;
            }
            else{
                while(compteur2 != compteur-1){
                    //tmp2->nxt;
                    compteur2++;
                }
                if(tmp->nxt == NULL){
                    tmp2->nxt = NULL;
                }
                else{
                    tmp2->nxt=tmp->nxt;            
                }

                free(tmp);
                return liste;
            }
        }
        compteur++;
    }
    return liste;
}

/*
 Fonction la plus utile et utilisée dans mon programme, elle recherche 
 une valeur dans la liste, et si elle l'a trouve la supprimer, en ayant 
 préallablement fait un calcul avec la deuxieme valeur de la liste, le temps
*/
llist2 supprimerElement(llist2 list, int valeur,float *P,int k,float t)
{
    llist2 tmp;
    llist2 previous;
     
    if (list == NULL) // si la liste est NULL on s'arrete tout de suite
      return (list);
    previous = list;
    if (previous->val == valeur) // Verifie la tete de liste, cas particulier
    {
        if(k!=4){
            *P= *P +(t-previous->val2);

        }
      list = previous->nxt;
      free(previous);
      return (list);
    }
    tmp = previous->nxt; // le cas n est gere on se place donc sur le cas n+1
    while(tmp != NULL) // On Mouline est on supprime si on trouve l'element
    {
      if (tmp->val == valeur)
      {
        if(k!=4){
            *P= *P + (t-tmp->val2);
        }
        previous->nxt = tmp->nxt;
        free(tmp);
        return (list);
      }
      previous = tmp; // pour ce souvenir dans la prochaine iteration du precedent
      tmp = tmp->nxt;
    }
    return list;
}

llist2 supprimerElement2(llist2 list, int valeur,float *P,int k,float t,float *min,float *max)
{
    llist2 tmp;
    llist2 previous;
     
    if (list == NULL) // si la liste est NULL on s'arrete tout de suite
      return (list);
    previous = list;
    if (previous->val == valeur) // Verifie la tete de liste, cas particulier
    {
        if(k!=4){
            *P= *P +(t-previous->val2);
            if(t-previous->val2>*max){
                *max = t-previous->val2;
            }
            else if(t-previous->val2 < *min){
                *min = t-previous->val2;
            }
            
        }
      list = previous->nxt;
      free(previous);
      return (list);
    }
    tmp = previous->nxt; // le cas n est gere on se place donc sur le cas n+1
    while(tmp != NULL) // On Mouline est on supprime si on trouve l'element
    {
      if (tmp->val == valeur)
      {
        if(k!=4){
            *P= *P + (t-tmp->val2);
            if(t-previous->val2>*max){
                *max = t-previous->val2;
            }
            else if(t-previous->val2 < *min){
                *min = t-previous->val2;
            }
        }
        previous->nxt = tmp->nxt;
        free(tmp);
        return (list);
      }
      previous = tmp; // pour ce souvenir dans la prochaine iteration du precedent
      tmp = tmp->nxt;
    }
    return list;
}

void afficheElements2(llist2 liste){

    if(liste== NULL){
        printf("liste vide");
    }
    else{
        llist2 res;
        res = liste;
        while(res != NULL) {
            printf("%d\n",res->val);
            printf("%f\n",res->val2);
            res = res->nxt;
        }
    }
}

int nombreElements2(llist2 liste)
{
    /* Si la liste est vide, il y a 0 élément */
    if(liste == NULL)
        return 0;
    /* Sinon, il y a un élément (celui que l'on est en train de traiter)
    plus le nombre d'éléments contenus dans le reste de la liste */
    return nombreElements2(liste->nxt)+1;
}

void freeListe2(llist2 l){
    llist2 temp;
    while (l!=NULL) {
        temp=l->nxt;
        free(l);
        l=temp;
    }
}