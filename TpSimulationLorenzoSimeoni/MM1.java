
public class MM1 {
	public static void main(String[] args)
	{
		Chrono chrono = new Chrono();
		chrono.start(); // démarrage du chrono
		
		
		//On initialise l'échéancier à remplir
		Ech Echéancier= new Ech();
		Evt Evennement= new Evt();
		//On initialise un objet Statistiques qui nous donneras tous les résultats théoriques
		//et expérimentaux, et on lui passe lambda, mu et le temps en paramètres
		Stats Statistiques= new Stats(Double.parseDouble(args[0]), Double.parseDouble(args[1]), Double.parseDouble(args[2]));
		
		//On passe Lamnda et Mu a l'objet issu d'utile pour qu'il puisse faire les calculs de T
		Utile U = new Utile(Double.parseDouble(args[0]), Double.parseDouble(args[1]));
		double horloge=Double.parseDouble(args[2]);

		//ce booléen sert à continuer de remplir l'échéancier tant que l'horloge n'est pas dépassée et 
		//et que traitement renvoi true
		//On fait un do while pour ne pas faire 1 fois de trop le traitement
		boolean a = true;
		do {
			a = Echéancier.traitement(U,horloge,Integer.parseInt(args[3]),Statistiques);
			//On augmente le nombre total de client à chaque fois, on aurait pu aussi l'avoir avec le numéro du dernier client
			//mais bon...
			Statistiques.IncrémenterNombreTotalClient();
			
		}while(a==true);
		
		//On calcule le debit théorique avec le nombre de client qu'on a trouvé
		Statistiques.setDebitE(Statistiques.getNombreTotalClient()/horloge);
		
		int count = 0;
		double loop = 0;
		
		//Ici on vide tant que l'échéancier est complétement vide
		while(Echéancier.size()!=0){
			Evennement = Echéancier.get(0);
			loop= Evennement.getDate();
			
			count=0;
			
			//Ici on ne peut pas comme dans traitement utiliser un while(on trouve une arrivée)
			//On regarde donc quand l'échéancier est assez grand les 50 derniers évènements 
			//Car la file est stable sinon on regarde jusqu'au bout
			if(Evennement.getTypeEvt()==false){
				
				if(Echéancier.size()>50){
					for(int i = 1; i<50; i=i+1){
						Evennement=Echéancier.get(i);
						if(Evennement.getDate()<=loop) {
							loop = Evennement.getDate();
							count = i;
						}
					}
				}
				
				else{
					for(int i = 0; i < Echéancier.size(); i++) {
						Evennement=Echéancier.get(i);
						if(Evennement.getDate()<=loop) {
							loop = Evennement.getDate();
							count = i;
						}
					}
				}
			}

			Statistiques.additionNombreClientsDansSysteme(count);
			Evennement=Echéancier.get(count);

			if(Integer.parseInt(args[3])==1 && Evennement.getTypeEvt()==true){
				System.out.println("Date Arrivée "+Evennement.getDate()+ " Arrivée "+" client #"+Evennement.getNumero());
			}
			else if(Integer.parseInt(args[3])==1 && Evennement.getTypeEvt()==false){
				System.out.println("Date Départ "+Evennement.getDate()+ " Départ "+" client #"+Evennement.getNumero() + " Date Arrivée "+ Evennement.getDate2());
			}
			Echéancier.remove(count);
			
			
		}
		
		//on print enfin tous les résultats
		
		System.out.println("--------------------");
		System.out.println("RESULTATS THEORIQUES");
		System.out.println("--------------------");
		System.out.println("lambda < mu : file stable");
		System.out.println("ro = "+Statistiques.getRo());
		System.out.println("nombre de clients attendus = "+Statistiques.getnbTotalClientsAttendus());
		System.out.println("Prob de service sans attente = "+Statistiques.getProbServiceSansAttente());
		System.out.println("Prob file occupée = "+Statistiques.getProbFileOccupée());
		System.out.println("Debit = "+Statistiques.getDebit());
		System.out.println("Esp nb clients = "+Statistiques.getEspnbClients());
		System.out.println("Temps moyen de séjour = "+Statistiques.getTempsMoyenSejour());
		System.out.println("");
		
		System.out.println("--------------------");
		System.out.println("RESULTATS SIMULATION");
		System.out.println("--------------------");
		System.out.println("Nombre total de clients = "+Statistiques.getNombreTotalClient());
		System.out.println("Proportion de clients sans attente = "+Statistiques.getPropClientsSansAttente()/Statistiques.getNombreTotalClient());
		System.out.println("Proportion de clients avec attente = "+ Statistiques.getPropClientsAvecAttente()/Statistiques.getNombreTotalClient());
		System.out.println("Debit = "+Statistiques.getDebitE());
		System.out.println("Nb moyen de clients dans système = "+Statistiques.getNombreClientsDansSysteme()/Statistiques.getNombreTotalClient());
		System.out.println("Temps moyen de séjour = "+Statistiques.getTempsMoyenSejourE()/Statistiques.getNombreTotalClient());
		System.out.println("");
		
		
		chrono.stop(); // arrêt
		System.out.println(chrono.getDureeMs()); // affichage du résultat en millisecondes
		System.out.println(chrono.getDureeSec()); // affichage en secondes
		System.out.println(chrono.getDureeTxt()); // affichage au format "1 h 26 min 32 s"

	}
}
