#include "Tracage.h"

#define TAILLE_LIGNE 100
#define NBROUTEURS 26


int main(int argc, char *argv[])
{
	if(argc != 2){
		printf("Vous n'avez pas mis le bons nombres de paramètres");
		return 0;
	}

	clock_t temps;

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

	int compteur = 0;
	int compteurFlux=0;
	float compteurPaquetsDetruits=0.0;
	float compteurDepartSource=0.0;
	int compteurPaquetsRecus = 0;
	int compteurPaquetsTraites = 0;
	float LocalisationPerte[26]={0.0};
	int booleen = 0;


	//int *tableauDeFlux=malloc(sizeof());
	
	llist listeFlux = NULL;
	llist2 ListeTemps = NULL;
	llist2 ListeTempsAttenteFiles = NULL;
	llist2 ListeTempsTransmissionLiens = NULL;
	float *PTempsTotalSansPertes;
	float TempsTotalSansPertes = 0.0;
	PTempsTotalSansPertes = &TempsTotalSansPertes;

	float TempsAttenteFiles = 0.0;
	float *PTempsAttenteFiles=&TempsAttenteFiles;

	float TempsTransmissionLiens = 0.0;
	float *PTempsTransmissionLiens = &TempsTransmissionLiens;

	matrix MatriceDeRouteurs;
	MatriceDeRouteurs=alloueMatrice(NBROUTEURS, NBROUTEURS);
	MatriceDeRouteurs=initMatrice(MatriceDeRouteurs);
	MatriceDesFlux(MatriceDeRouteurs,fichierFlux);
	//afficheMatrice(MatriceDeRouteurs);

	resultTracage paquetATracer;
	for(int i =0;i<26;i++){
		paquetATracer.TempsRouteursRencontres[i]=0.0;
		paquetATracer.TableauFilesAttentesTraversees[i]=0.0;
	}
	int enregistreurRouteur = 0;


	paquetATracer.pid = atoi(argv[1]);

	int compteurlignes=0;
	while(fgets(chaine,TAILLE_LIGNE,fichier)!= NULL && compteurlignes != 1000)
	{
		compteurlignes++;
		compteur++;
		//printf("%s",chaine);
		sscanf(chaine,"%lf %i" ,&t, &code);
		if(code==4){
			sscanf(chaine, "%lf %i %i %i %i %s %s %s", &t, &code, &pid , &fid, &tos, s,d,pos);
			compteurPaquetsDetruits++;
			pos[0]='0';
			int k = atoi(pos);
			LocalisationPerte[k-1]++;
			//rechercherElement2(ListeTemps, pid, PTempsTotalSansPertes, code);
			ListeTemps=supprimerElement(ListeTemps, pid, PTempsTotalSansPertes, code,t);
			ListeTempsAttenteFiles=supprimerElement(ListeTempsAttenteFiles, pid, PTempsAttenteFiles, code,t);
			ListeTempsTransmissionLiens=supprimerElement(ListeTempsTransmissionLiens,pid,PTempsTransmissionLiens,code,t);

			//afficheElements2(ListeTemps);
			if(pid == paquetATracer.pid){
				paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles+t;
				paquetATracer.TTransmissionLiens=paquetATracer.TTransmissionLiens-t;
				paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1] = t - paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1];
			}
		}
		else{
			sscanf(chaine, "%lf %i %i %i %i %i %s %s %s", &t, &code, &pid , &fid, &tos, &bif, s,d,pos);
			if(code==0){
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
				compteurPaquetsRecus++;
				ListeTemps=supprimerElement(ListeTemps, pid, PTempsTotalSansPertes, code,t);
				ListeTempsAttenteFiles=supprimerElement(ListeTempsAttenteFiles, pid, PTempsAttenteFiles, code,t);
				//ListeTempsTransmissionLiens=supprimerElement(ListeTempsTransmissionLiens,pid,PTempsTransmissionLiens,code,t);
				if(pid == paquetATracer.pid){
					pos[0]='0';
					int k = atoi(pos);
					paquetATracer.TAttenteFiles=paquetATracer.TAttenteFiles+t;
					paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1] = t - paquetATracer.TableauFilesAttentesTraversees[enregistreurRouteur-1];
				}
			}
			else if(code==1){
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

		}
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
		printf("La proportion de paquets perdus dans ce noeud est de %.2fpourcent\n",(LocalisationPerte[k]/compteurPaquetsDetruits)*100);
	}

	printf("Temps total = %fs\n",*PTempsTotalSansPertes);
	printf("Delai moyen de bout en bout = %fs\n",*PTempsTotalSansPertes/(compteurDepartSource-compteurPaquetsDetruits));

	printf("Temps dattente dans les files = %fs\n",*PTempsAttenteFiles);
	printf("Temps de transmission dans les liens = %fs\n",*PTempsTransmissionLiens);

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