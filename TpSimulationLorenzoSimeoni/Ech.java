import java.util.LinkedList;


public class Ech{

	LinkedList<Evt> ech;//on initialise une chaine de caractère vide
	private Evt evtInitial;//On initialise le premier évènement de la LinkedList
	
	//Constructeur par défault ou l'on met l'évènement dans la LinkedList
	public Ech(){
		ech = new LinkedList<Evt>();
		evtInitial = new Evt();
		ech.add(evtInitial);
	}
	//pas besoin de Constructeur avec paramètres car le premier est toujours une arrivée au temps 0
	
	public boolean traitement(Utile U, double horloge,int debug, Stats Statistiques){
		
		Evt evenement= new Evt();//Permet la construction des nouvelles arrivées
		Evt evenementAnterieur= new Evt();//Permet la construction du nouveau départ
		Evt evenementaRemove = new Evt();//Permet de supprimer des évènements au fur et à mesure
	
		
		evenement=getLast();//on prend le dernier évènement, qui est une arrivée car la liste est (A,D,A,D....)
		evenementaRemove=get(0);//on prend le premier évènement de la liste, le plus ancien
		
		//Si il n'y a pas qu'un seul évènement, comme au début, on va pouvoir comparer le dernier temps de départ et d'arrivé
		//Si le dernier temps de départ < dernier temps d'arriver, alors on prend le dernier temps d'arrivé
		//sinon on prend le dernier temps de départ, pour ne pas qu'un départ n arrive avant son arrivée n.
		if(size()!=1){
			evenementAnterieur=get(size()-2);
			if(evenementAnterieur.getDate()<evenement.getDate()){
				evenementAnterieur=evenement;
				Statistiques.IncrementerPropClientsSansAttente();//de plus si on prend le temps d'arrivé, le client d'avant sera
																//déjà parti donc on peut calculer la proportion de client sans attente
			}
			else{
				Statistiques.IncrementerPropClientsAvecAttente();//par contre si on prend le temps de départ, le prochain arrivé devra
																//attendre que celui ci ai fini
			}
		}
		else{
			evenementAnterieur=getLast();
		}
		//ici on calcule un x et un y aléatoirement entre ]0,1[
		//si ils sont égaux à 0 ou 1 on recommence
		double x = 0;
		while(x==0 || x==1){
			x =Math.random();
		}
				
		//On utilise Ensuite le x pour la formule du temps de service dans Utile.java
		double T1 =evenement.getDate()+ U.TempsService(x);

		
		double y = 0;
		while(y==0 || y==1){
			y =Math.random();
		}
		//On utilise le y pour la formule du temps d'arrivé dans Utile.java
		double T2 =evenementAnterieur.getDate()+ U.TempsArrive(y);
		
		//Temps moyen de séjour =Temps départ -Temps arrivé/nombre total client
		//ici on calcule a chaque nouveaux évènement le temps de départ - temps arrivé
		Statistiques.additionTempsMoyenSejourE(T2);
		Statistiques.soustractionTempsMoyenSejourE(evenement.getDate());
		
		//L'horloge est le temps fixé au début par l'utilisateur que ne peut pas dépasser la date d'une arrivée
		//Du coup si tout va bien on créé les deux évènements, on les ajoutent à l'échéancier et on continu
		if(horloge>T1){
			Evt E2= new Evt(false, T2, evenement.getDate(),evenement.getNumero());
			ech.add(E2);
			
			Evt E1= new Evt(true, T1,0, evenement.getNumero());
			ech.add(E1);
		}

		//Si l'horloge est dépassé par le temps de la prochaine arrivé, on ne créé que le prochain départ
		//et on sort de la boucle dans MM1.java en renvoyant false
		else if(horloge<T1){
			Evt E2= new Evt(false, T2, evenement.getDate(),evenement.getNumero());
			ech.add(E2);
			return false;
		}
		
		//ici on commence à supprimer des évènements, si on a une arrivée en premier, c'est bien le temps
		//Minimum de tout l'échéancier du coup on la print si debug=1 et ensuite on la supprime
		if(evenementaRemove.getTypeEvt()==true){
			if(debug ==1){
				System.out.println("Date Arrivée "+evenementaRemove.getDate()+ " Arrivée "+" client #"+evenementaRemove.getNumero());
			}

			ech.remove(0);
		}
		//Si l'évènement est un départ, il peut y avoir un évènement avec une date infèrieure, une arrivée infèrieure
		else if(evenementaRemove.getTypeEvt()==false){
			
			int count = 0;
			double loop = evenementaRemove.getDate();
			boolean boucle = false;
			//Si l'échéancier n'est pas trop petit, on regarde les valeurs d'après jusqu'a trouver une arrivée
			//car les autres départ ne peuvent qu'être supètieurs, si l'arrivée est supèrieur on supprime
			//le départ, sinon on supprime l'arrivée
			while(boucle == false){
				count=count+1;
				evenementaRemove=get(count);
				boucle = evenementaRemove.getTypeEvt();
			}
			
			if(evenementaRemove.getDate()>=loop) {
				count=0;
				evenementaRemove=get(count);
			}
			
			//On ajoute le nombre de clients qu'il y a dans le système
			Statistiques.additionNombreClientsDansSysteme(count);
			
			

			//Ici on print les évènements pour le debug
			if(debug==1 && evenementaRemove.getTypeEvt()==true){
				System.out.println("Date Arrivée "+evenementaRemove.getDate()+ " Arrivée "+" client #"+evenementaRemove.getNumero());
			}
			else if(debug == 1 && evenementaRemove.getTypeEvt()==false){
				System.out.println("Date Départ "+evenementaRemove.getDate()+ " Départ "+" client #"+evenementaRemove.getNumero() + " Date Arrivée "+ evenementaRemove.getDate2());
			}
			//On enlève l'évènement choisi
			remove(count);
		}
		
		//Ici on va supprimer 1 élément de plus si liste devient trop grosse
		if(size()>100){
			evenementaRemove=get(0);
			int count = 0;
			double loop = evenementaRemove.getDate();
			if(evenementaRemove.getTypeEvt()==false){
				boolean boucle = false;
				//Si l'échéancier n'est pas trop petit, on regarde les valeurs d'après jusqu'a trouver une arrivée
				//car les autres départ ne peuvent qu'être supètieurs, si l'arrivée est supèrieur on supprime
				//le départ, sinon on supprime l'arrivée
				while(boucle == false){
					count=count+1;
					evenementaRemove=get(count);
					boucle = evenementaRemove.getTypeEvt();
				}
				
				if(evenementaRemove.getDate()>=loop) {
					count=0;
					evenementaRemove=get(count);
				}
				
				//On ajoute le nombre de clients qu'il y a dans le système
				Statistiques.additionNombreClientsDansSysteme(count);

			}
			if(debug == 1 && evenementaRemove.getTypeEvt()==true){
				System.out.println("Date Arrivée "+evenementaRemove.getDate()+ " Arrivée "+" client #"+evenementaRemove.getNumero());
			}
			else if( debug == 1 && evenementaRemove.getTypeEvt()==false){
				System.out.println("Date Départ "+evenementaRemove.getDate()+ " Départ "+" client #"+evenementaRemove.getNumero() + " Date Arrivée "+ evenementaRemove.getDate2());
			}
			remove(count);
		}
		//On return true tant que l'horloge n'a pas été dépassée
		return true;
	}

	public Evt getLast() {
		return ech.getLast();
	}

	public int size() {
		return ech.size();
	}

	public Evt get(int i) {
		return ech.get(i);
	}

	public void remove(int count) {
		ech.remove(count);
		
	}

	public Evt getFirst() {
		return getFirst();
	}
	
}