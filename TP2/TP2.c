#include "Tracage.h"
#include <math.h>

//ce Define est utilisé pour lire une ligne avec fgets
#define TAILLE_LIGNE 100
//utile pour faire des matrices de taille 26
#define NBROUTEURS 26

/*
 Programme principal où on effectue tous les calculs
*/
int main(int argc, char *argv[])
{
	if(argc != 4){
		printf("Vous n'avez pas mis le bons nombres de paramètres\n");
		printf("Vous devez executer le programme par exemple comme ça : ./TP2 PAQUETATRACER 0 FLUX\n");
		return 0;
	}
	// on lance le temps
	clock_t temps;

	//On créé toutes les variables utiles
	FILE* fichier = NULL;
	FILE* fichierFlux = NULL;
	char chaine[TAILLE_LIGNE]="";
	double t = 0.0;
	int code = 0;
	int pid =0;
	int fid =0;
	int tos =0;
	int bif =0;
	char s[4];
	char d[4];
	char pos[4];
	int testbooleen=0;
    
    //ouverture du fichier utile à gnuplot
    FILE *graphe = NULL;
    graphe = fopen("NombreDeFlux.txt","w+");
    char strCompteurFLux[150];
    int boolgraph=atoi(argv[2]);
 

    //on accède au fichier de la trace et de la matrice
	fichier = fopen("trace2650.txt","r");
	if(fichier == NULL){
		printf("Erreur dans l'ouverture du fichier");
		fclose(fichier);
		exit(1);
	}
	fichierFlux = fopen("res26.txt","r");
	if(fichierFlux == NULL){
		printf("Erreur dans l'ouverture du fichier");
		fclose(fichierFlux);
		exit(1);
	}

	//D'autres variables utiles, le nom est souvent assez explicite
	int compteur = 0;
	int compteurFlux=0;
	float compteurPaquetsDetruits=0.0;
	float compteurDepartSource=0.0;
	int compteurPaquetsRecus = 0;
	int compteurPaquetsTraites = 0;
	float LocalisationPerte[26]={0.0};
	int booleen = 0;
	
	llist listeFlux = NULL;
	llist2 ListeTemps = NULL;
	//permet de calculer l'écart type pour la valeur moyenne d'un parcours
	float min = 1.0;
	float *pmin=&min;
	float max = 0.0;
	float *pmax=&max;
	llist2 ListeTempsAttenteFiles = NULL;
	llist2 ListeTempsTransmissionLiens = NULL;
	float *PTempsTotalSansPertes;
	float TempsTotalSansPertes = 0.0;
	PTempsTotalSansPertes = &TempsTotalSansPertes;

	float TempsAttenteFiles = 0.0;
	float *PTempsAttenteFiles=&TempsAttenteFiles;
	//Deuxieme variable permettant d'avoir les valeurs pour un seul flux
	float TempsAttenteFilesPourUnFLux = 0.0;
	int pidDuPaquet = 0;

	float TempsTransmissionLiens = 0.0;
	float *PTempsTransmissionLiens = &TempsTransmissionLiens;

	matrix MatriceDeRouteurs;
	MatriceDeRouteurs=alloueMatrice(NBROUTEURS, NBROUTEURS);
	MatriceDeRouteurs=initMatrice(MatriceDeRouteurs);
	MatriceDesFlux(MatriceDeRouteurs,fichierFlux);
	int nbPaquetsDansFilesAttentes = 0;
	//afficheMatrice(MatriceDeRouteurs);

	resultTracage paquetATracer;
	for(int i =0;i<26;i++){
		paquetATracer.TempsRouteursRencontres[i]=0.0;
		paquetATracer.TableauFilesAttentesTraversees[i]=0.0;
	}
	int enregistreurRouteur = 0;

	paquetATracer.TTransmissionLiens=0.0;
	paquetATracer.TAttenteFiles=0.0;
	paquetATracer.pid = atoi(argv[1]);

	int compteurlignes=0;

	//On récupère chaque ligne dans une chaine
	while(fgets(chaine,TAILLE_LIGNE,fichier)!= NULL /*&& compteurlignes != 1000000*/)
	{
		compteurlignes++;
		compteur++;
		//printf("%s",chaine);
		//On fait attention si le code est à 4 ou non, si il est à 4, on aura pas le même nombre d'arguments
		sscanf(chaine,"%lf %i" ,&t, &code);
		if(code==4){
			nbPaquetsDansFilesAttentes--; //On décrémente à chaque pertes
			sscanf(chaine, "%lf %i %i %i %i %s %s %s", &t, &code, &pid , &fid, &tos, s,d,pos);
			compteurPaquetsDetruits++;
			pos[0]='0';
			int k = atoi(pos);
			//on incrémente le nombre de paquets perdus par chaque routeurs
			LocalisationPerte[k-1]++;

			//Permet de tracer le graphe du temps d'attente dans un flux
			ListeTempsAttenteFiles=supprimerElement(ListeTempsAttenteFiles, pid, PTempsAttenteFiles, code,t);

			if(atoi(argv[3])==fid){
				TempsAttenteFilesPourUnFLux = *PTempsTotalSansPertes;
				//on incrémente ou décrémente les listes qui calcules les temps d'attentes ...
				//quand un élément est envoyé mais pas encore arrivé, il est dans la liste, quand il arrive on l'enlève
				ListeTemps=supprimerElement2(ListeTemps, pid, PTempsTotalSansPertes, code,t,pmin,pmax);
				TempsAttenteFilesPourUnFLux = *PTempsTotalSansPertes - TempsAttenteFilesPourUnFLux;
				pidDuPaquet = pid;
				//printf("%lf\n",*PTempsAttenteFiles);
			}
			else{
				ListeTemps=supprimerElement2(ListeTemps, pid, PTempsTotalSansPertes, code,t,pmin,pmax);
			}
			ListeTempsTransmissionLiens=supprimerElement(ListeTempsTransmissionLiens,pid,PTempsTransmissionLiens,code,t);

			//Si le numéro du paquet à tracer est dans la chaine
			if(pid == paquetATracer.pid){
				paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles+t;
				paquetATracer.TTransmissionLiens=paquetATracer.TTransmissionLiens-t;
				paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1] = t - paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1];
			}
		}
		else{
			sscanf(chaine, "%lf %i %i %i %i %i %s %s %s", &t, &code, &pid , &fid, &tos, &bif, s,d,pos);
			if(code==0){
				//On incrémente le nb de paquet dans un file à chaque départ
				nbPaquetsDansFilesAttentes++;
				if(pid==paquetATracer.pid){
					pos[0]='0';
					int k = atoi(pos);
					strcpy(paquetATracer.s, s);
					strcpy(paquetATracer.d, d);
					paquetATracer.TableauFilesAttentesTraversees[k-1]=paquetATracer.TableauFilesAttentesTraversees[k-1]+t;
					paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles-t;
					enregistreurRouteur = k;
				}

				compteurDepartSource++;

				ListeTemps=ajouterEnFin2(ListeTemps,pid,t);
				ListeTempsAttenteFiles=ajouterEnTete2(ListeTempsAttenteFiles,pid,t);

				//afficheElements2(ListeTemps);
			}
			else if(code==3){
				nbPaquetsDansFilesAttentes--;//On le décrémente à chaque arrivée
				compteurPaquetsRecus++;

				//condition pour avoir les delait de bouts en bouts de l'ensemble des paquets d'un flux 
				if(atoi(argv[3])==fid){
					TempsAttenteFilesPourUnFLux = *PTempsTotalSansPertes;
					//printf("%lf\n",*PTempsAttenteFiles);
					ListeTemps=supprimerElement2(ListeTemps, pid, PTempsTotalSansPertes, code,t,pmin,pmax);
					TempsAttenteFilesPourUnFLux = *PTempsTotalSansPertes - TempsAttenteFilesPourUnFLux;
					pidDuPaquet = pid;
					//printf("%lf\n",*PTempsAttenteFiles);
				}
				else{
					ListeTemps=supprimerElement2(ListeTemps, pid, PTempsTotalSansPertes, code,t,pmin,pmax);
				}

				ListeTempsAttenteFiles=supprimerElement(ListeTempsAttenteFiles, pid, PTempsAttenteFiles, code,t);

				if(pid == paquetATracer.pid){
					pos[0]='0';
					int k = atoi(pos);
					paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles+t;
					paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1] = t - paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1];
				}
			}
			else if(code==1){
				nbPaquetsDansFilesAttentes++;//On l'augmente à chaque arrivée dans un noeud
				if(pid == paquetATracer.pid){
					pos[0]='0';
					int k = atoi(pos);
					paquetATracer.TempsRouteursRencontres[k-1]=t;
					paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles-t;
					paquetATracer.TTransmissionLiens=paquetATracer.TTransmissionLiens+t;
					paquetATracer.TableauFilesAttentesTraversees[k-1]=paquetATracer.TableauFilesAttentesTraversees[k-1]+t;
					//printf("%f %f\n",paquetATracer.TTransmissionLiens, t);
					enregistreurRouteur = k;
					if(booleen != 1){
						paquetATracer.tempsPourCalculerTaille = t - paquetATracer.tempsPourCalculerTaille;
						//printf("%f",paquetATracer.tempsPourCalculerTaille);
						booleen = 1;
					}
				}


				ListeTempsAttenteFiles=ajouterEnTete2(ListeTempsAttenteFiles,pid,t);
				ListeTempsTransmissionLiens=supprimerElement(ListeTempsTransmissionLiens,pid,PTempsTransmissionLiens,code,t);

			}
			else if(code==2){
				nbPaquetsDansFilesAttentes--;//On décrémente à chaque sortie de neouds

				compteurPaquetsTraites++;

				ListeTempsTransmissionLiens=ajouterEnTete2(ListeTempsTransmissionLiens,pid,t);
				ListeTempsAttenteFiles=supprimerElement(ListeTempsAttenteFiles, pid, PTempsAttenteFiles, code,t);

				if(pid == paquetATracer.pid){
					paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles+t;
					paquetATracer.TTransmissionLiens=paquetATracer.TTransmissionLiens-t;
					paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1] = t - paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1];
					if(booleen != 1){
						pos[0]='0';
						int k = atoi(pos);
						s[0]='0';
						int k2 = atoi(s);
						paquetATracer.tempsPourCalculerTaille = t;
						paquetATracer.Debit=MatriceDeRouteurs.mat[k-1][k2-1];
						if(paquetATracer.Debit<MatriceDeRouteurs.mat[k2-1][k-1]){
							paquetATracer.Debit = MatriceDeRouteurs.mat[k2-1][k-1];
						}
					}
				}
			}
			//on rempli le fichier pour gnuplot
			if(boolgraph==1){
				compteurFlux=nombreElements(listeFlux);
				sprintf(strCompteurFLux, "%lf\t%d\t%lf\t%f\t%d\t%f\t%d\n",t,compteurFlux,compteurPaquetsDetruits,compteurDepartSource-(compteurPaquetsDetruits+compteurPaquetsRecus),\
					nbPaquetsDansFilesAttentes,TempsAttenteFilesPourUnFLux,pid);
				fputs(strCompteurFLux,graphe);
				TempsAttenteFilesPourUnFLux = 0.0;
			}
		}
		//Si le flux est nouveau, il ne sera pas dans la liste, donc on l'ajoute
		testbooleen=rechercherElement(listeFlux,fid);
		if(testbooleen==0){
			listeFlux=ajouterEnTete(listeFlux,fid);
		}
	}
	//afficheElements(listeFlux);
	printf("Nombre de paquets traités/émis/reçus = %i\n",compteur);
	printf("Nombre de paquets envoyés = %.0f\n",compteurDepartSource);
	printf("Nombre de paquets reçus = %d\n",compteurPaquetsRecus);
	printf("Nombre de paquets traités = %d\n",compteurPaquetsTraites);

	compteurFlux=nombreElements(listeFlux);


	printf("Nombre de flux : %i\n",compteurFlux);
	printf("Nombre paquets perdus : %.0f\n",compteurPaquetsDetruits);
	float TauxPertes = (compteurPaquetsDetruits/compteurDepartSource)*100;
	printf("Taux de pertes : %.2f\n",TauxPertes);

	for(int k=0;k<26;k++){
		printf("Le nombre de perte au noeud %d est de %.0f\n",k+1,LocalisationPerte[k]);
		printf("La proportion de paquets perdus dans ce noeud est de %.2f%%\n",(LocalisationPerte[k]/compteurPaquetsDetruits)*100);
	}

	printf("Temps total = %fs\n",*PTempsTotalSansPertes);
	printf("Delai moyen de bout en bout = %fs\n",*PTempsTotalSansPertes/(compteurDepartSource-compteurPaquetsDetruits));
	printf("L'écart type des Delais de bout en bout vaut %f\n",*pmax-*pmin);
	printf("On prend un interval de confiance à 95%% on a donc une marge d'erreur de %f\n",1.96*((*pmax-*pmin)/pow(compteurDepartSource,0.5)));

	printf("Temps dattente dans les files = %fs\n",*PTempsAttenteFiles);
	printf("Temps d'attente moyen dans les files = %fs\n",*PTempsAttenteFiles/(compteurPaquetsTraites+compteurPaquetsRecus));
	printf("Temps de transmission dans les liens = %fs\n",*PTempsTransmissionLiens);
	printf("Temps de transmission moyen dans les liens = %fs\n",*PTempsTransmissionLiens/compteurPaquetsTraites);

	//n'affiche les valeurs que si le paquet existe
	if(paquetATracer.TTransmissionLiens>0.000001){
			printf("Le paquet a tracer était le Numero : %d\n",paquetATracer.pid);
		printf("Sa source était %s\n",paquetATracer.s);
		printf("Sa destination était %s\n",paquetATracer.d);
		paquetATracer.taille=paquetATracer.Debit*(paquetATracer.tempsPourCalculerTaille*1000000);
		printf("Sa taille est de %dbits\n",paquetATracer.taille);
		printf("Son temps d'attente dans les files était de %f\n",paquetATracer.TAttenteFiles);
		printf("Son Temps de transmission sur les liens était de %f\n",paquetATracer.TTransmissionLiens);
		for(int i = 0; i<26;i++){
			if(paquetATracer.TempsRouteursRencontres[i]>0.00001){
				printf("Le paquet a traversé le Routeur N%d au temps %f\n",i+1,paquetATracer.TempsRouteursRencontres[i]);
				printf("Il y a attendu %f dans la file d'attente\n",paquetATracer.TableauFilesAttentesTraversees[i]);
			}
		}
	}
	else{
		printf("Le paquet n'existe pas\n");
	}


	if(boolgraph==1){
		FILE *pipe = popen("gnuplot -persist","w");
		FILE *pipe2 = popen("gnuplot -persist","w");
		FILE *pipe3 = popen("gnuplot -persist","w");
		FILE *pipe4 = popen("gnuplot -persist","w");
		FILE *pipe5 = popen("gnuplot -persist","w");
		fprintf(pipe, "plot 'NombreDeFlux.txt' using 1:2 with lines title \"Nb Flux ouverts\" \n");
		fprintf(pipe2, "plot 'NombreDeFlux.txt' using 1:3 with lines title \"Nb de Pertes\"\n");
		fprintf(pipe3, "plot 'NombreDeFlux.txt' using 1:4 with lines title \"Nb paquets en transit\"\n");
		fprintf(pipe4, "plot 'NombreDeFlux.txt' using 1:5 with lines title \"Nb de paquets en attente dans l'ensemble des files d'attentes\"\n");
		fprintf(pipe5, "plot 'NombreDeFlux.txt' using 7:6 with point title \"Delai de bout en bout pour le flux %d\"\n",atoi(argv[3]));
		fflush(pipe);
		fclose(pipe);
		fflush(pipe2);
		fclose(pipe2);
		fflush(pipe3);
		fclose(pipe3);
		fflush(pipe4);
		fclose(pipe4);
	}

	freeListe(listeFlux);
	freeListe2(ListeTemps);
	freeListe2(ListeTempsAttenteFiles);
	freeListe2(ListeTempsTransmissionLiens);
	freeMatrice(MatriceDeRouteurs);

	fclose(fichierFlux);
	fclose(fichier);
	temps=clock();
	printf("Le programme a duré %f s \n",(double)temps/CLOCKS_PER_SEC);

	return 0;
}