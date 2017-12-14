
public class MM1 {
	public static void main(String[] args)
	{
		Chrono chrono = new Chrono();
		chrono.start(); // d�marrage du chrono
		
		
		//On initialise l'�ch�ancier � remplir
		Ech Ech�ancier= new Ech();
		Evt Evennement= new Evt();
		//On initialise un objet Statistiques qui nous donneras tous les r�sultats th�oriques
		//et exp�rimentaux, et on lui passe lambda, mu et le temps en param�tres
		Stats Statistiques= new Stats(Double.parseDouble(args[0]), Double.parseDouble(args[1]), Double.parseDouble(args[2]));
		
		//On passe Lamnda et Mu a l'objet issu d'utile pour qu'il puisse faire les calculs de T
		Utile U = new Utile(Double.parseDouble(args[0]), Double.parseDouble(args[1]));
		double horloge=Double.parseDouble(args[2]);

		//ce bool�en sert � continuer de remplir l'�ch�ancier tant que l'horloge n'est pas d�pass�e et 
		//et que traitement renvoi true
		//On fait un do while pour ne pas faire 1 fois de trop le traitement
		boolean a = true;
		do {
			a = Ech�ancier.traitement(U,horloge,Integer.parseInt(args[3]),Statistiques);
			//On augmente le nombre total de client � chaque fois, on aurait pu aussi l'avoir avec le num�ro du dernier client
			//mais bon...
			Statistiques.Incr�menterNombreTotalClient();
			
		}while(a==true);
		
		//On calcule le debit th�orique avec le nombre de client qu'on a trouv�
		Statistiques.setDebitE(Statistiques.getNombreTotalClient()/horloge);
		
		int count = 0;
		double loop = 0;
		
		//Ici on vide tant que l'�ch�ancier est compl�tement vide
		while(Ech�ancier.size()!=0){
			Evennement = Ech�ancier.get(0);
			loop= Evennement.getDate();
			
			count=0;
			
			//Ici on ne peut pas comme dans traitement utiliser un while(on trouve une arriv�e)
			//On regarde donc quand l'�ch�ancier est assez grand les 50 derniers �v�nements 
			//Car la file est stable sinon on regarde jusqu'au bout
			if(Evennement.getTypeEvt()==false){
				
				if(Ech�ancier.size()>50){
					for(int i = 1; i<50; i=i+1){
						Evennement=Ech�ancier.get(i);
						if(Evennement.getDate()<=loop) {
							loop = Evennement.getDate();
							count = i;
						}
					}
				}
				
				else{
					for(int i = 0; i < Ech�ancier.size(); i++) {
						Evennement=Ech�ancier.get(i);
						if(Evennement.getDate()<=loop) {
							loop = Evennement.getDate();
							count = i;
						}
					}
				}
			}

			Statistiques.additionNombreClientsDansSysteme(count);
			Evennement=Ech�ancier.get(count);

			if(Integer.parseInt(args[3])==1 && Evennement.getTypeEvt()==true){
				System.out.println("Date Arriv�e "+Evennement.getDate()+ " Arriv�e "+" client #"+Evennement.getNumero());
			}
			else if(Integer.parseInt(args[3])==1 && Evennement.getTypeEvt()==false){
				System.out.println("Date D�part "+Evennement.getDate()+ " D�part "+" client #"+Evennement.getNumero() + " Date Arriv�e "+ Evennement.getDate2());
			}
			Ech�ancier.remove(count);
			
			
		}
		
		//on print enfin tous les r�sultats
		
		System.out.println("--------------------");
		System.out.println("RESULTATS THEORIQUES");
		System.out.println("--------------------");
		System.out.println("lambda < mu : file stable");
		System.out.println("ro = "+Statistiques.getRo());
		System.out.println("nombre de clients attendus = "+Statistiques.getnbTotalClientsAttendus());
		System.out.println("Prob de service sans attente = "+Statistiques.getProbServiceSansAttente());
		System.out.println("Prob file occup�e = "+Statistiques.getProbFileOccup�e());
		System.out.println("Debit = "+Statistiques.getDebit());
		System.out.println("Esp nb clients = "+Statistiques.getEspnbClients());
		System.out.println("Temps moyen de s�jour = "+Statistiques.getTempsMoyenSejour());
		System.out.println("");
		
		System.out.println("--------------------");
		System.out.println("RESULTATS SIMULATION");
		System.out.println("--------------------");
		System.out.println("Nombre total de clients = "+Statistiques.getNombreTotalClient());
		System.out.println("Proportion de clients sans attente = "+Statistiques.getPropClientsSansAttente()/Statistiques.getNombreTotalClient());
		System.out.println("Proportion de clients avec attente = "+ Statistiques.getPropClientsAvecAttente()/Statistiques.getNombreTotalClient());
		System.out.println("Debit = "+Statistiques.getDebitE());
		System.out.println("Nb moyen de clients dans syst�me = "+Statistiques.getNombreClientsDansSysteme()/Statistiques.getNombreTotalClient());
		System.out.println("Temps moyen de s�jour = "+Statistiques.getTempsMoyenSejourE()/Statistiques.getNombreTotalClient());
		System.out.println("");
		
		
		chrono.stop(); // arr�t
		System.out.println(chrono.getDureeMs()); // affichage du r�sultat en millisecondes
		System.out.println(chrono.getDureeSec()); // affichage en secondes
		System.out.println(chrono.getDureeTxt()); // affichage au format "1 h 26 min 32 s"

	}
}
