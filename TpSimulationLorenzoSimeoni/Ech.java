import java.util.LinkedList;


public class Ech{

	LinkedList<Evt> ech;//on initialise une chaine de caract�re vide
	private Evt evtInitial;//On initialise le premier �v�nement de la LinkedList
	
	//Constructeur par d�fault ou l'on met l'�v�nement dans la LinkedList
	public Ech(){
		ech = new LinkedList<Evt>();
		evtInitial = new Evt();
		ech.add(evtInitial);
	}
	//pas besoin de Constructeur avec param�tres car le premier est toujours une arriv�e au temps 0
	
	public boolean traitement(Utile U, double horloge,int debug, Stats Statistiques){
		
		Evt evenement= new Evt();//Permet la construction des nouvelles arriv�es
		Evt evenementAnterieur= new Evt();//Permet la construction du nouveau d�part
		Evt evenementaRemove = new Evt();//Permet de supprimer des �v�nements au fur et � mesure
	
		
		evenement=getLast();//on prend le dernier �v�nement, qui est une arriv�e car la liste est (A,D,A,D....)
		evenementaRemove=get(0);//on prend le premier �v�nement de la liste, le plus ancien
		
		//Si il n'y a pas qu'un seul �v�nement, comme au d�but, on va pouvoir comparer le dernier temps de d�part et d'arriv�
		//Si le dernier temps de d�part < dernier temps d'arriver, alors on prend le dernier temps d'arriv�
		//sinon on prend le dernier temps de d�part, pour ne pas qu'un d�part n arrive avant son arriv�e n.
		if(size()!=1){
			evenementAnterieur=get(size()-2);
			if(evenementAnterieur.getDate()<evenement.getDate()){
				evenementAnterieur=evenement;
				Statistiques.IncrementerPropClientsSansAttente();//de plus si on prend le temps d'arriv�, le client d'avant sera
																//d�j� parti donc on peut calculer la proportion de client sans attente
			}
			else{
				Statistiques.IncrementerPropClientsAvecAttente();//par contre si on prend le temps de d�part, le prochain arriv� devra
																//attendre que celui ci ai fini
			}
		}
		else{
			evenementAnterieur=getLast();
		}
		//ici on calcule un x et un y al�atoirement entre ]0,1[
		//si ils sont �gaux � 0 ou 1 on recommence
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
		//On utilise le y pour la formule du temps d'arriv� dans Utile.java
		double T2 =evenementAnterieur.getDate()+ U.TempsArrive(y);
		
		//Temps moyen de s�jour =Temps d�part -Temps arriv�/nombre total client
		//ici on calcule a chaque nouveaux �v�nement le temps de d�part - temps arriv�
		Statistiques.additionTempsMoyenSejourE(T2);
		Statistiques.soustractionTempsMoyenSejourE(evenement.getDate());
		
		//L'horloge est le temps fix� au d�but par l'utilisateur que ne peut pas d�passer la date d'une arriv�e
		//Du coup si tout va bien on cr�� les deux �v�nements, on les ajoutent � l'�ch�ancier et on continu
		if(horloge>T1){
			Evt E2= new Evt(false, T2, evenement.getDate(),evenement.getNumero());
			ech.add(E2);
			
			Evt E1= new Evt(true, T1,0, evenement.getNumero());
			ech.add(E1);
		}

		//Si l'horloge est d�pass� par le temps de la prochaine arriv�, on ne cr�� que le prochain d�part
		//et on sort de la boucle dans MM1.java en renvoyant false
		else if(horloge<T1){
			Evt E2= new Evt(false, T2, evenement.getDate(),evenement.getNumero());
			ech.add(E2);
			return false;
		}
		
		//ici on commence � supprimer des �v�nements, si on a une arriv�e en premier, c'est bien le temps
		//Minimum de tout l'�ch�ancier du coup on la print si debug=1 et ensuite on la supprime
		if(evenementaRemove.getTypeEvt()==true){
			if(debug ==1){
				System.out.println("Date Arriv�e "+evenementaRemove.getDate()+ " Arriv�e "+" client #"+evenementaRemove.getNumero());
			}

			ech.remove(0);
		}
		//Si l'�v�nement est un d�part, il peut y avoir un �v�nement avec une date inf�rieure, une arriv�e inf�rieure
		else if(evenementaRemove.getTypeEvt()==false){
			
			int count = 0;
			double loop = evenementaRemove.getDate();
			boolean boucle = false;
			//Si l'�ch�ancier n'est pas trop petit, on regarde les valeurs d'apr�s jusqu'a trouver une arriv�e
			//car les autres d�part ne peuvent qu'�tre sup�tieurs, si l'arriv�e est sup�rieur on supprime
			//le d�part, sinon on supprime l'arriv�e
			while(boucle == false){
				count=count+1;
				evenementaRemove=get(count);
				boucle = evenementaRemove.getTypeEvt();
			}
			
			if(evenementaRemove.getDate()>=loop) {
				count=0;
				evenementaRemove=get(count);
			}
			
			//On ajoute le nombre de clients qu'il y a dans le syst�me
			Statistiques.additionNombreClientsDansSysteme(count);
			
			

			//Ici on print les �v�nements pour le debug
			if(debug==1 && evenementaRemove.getTypeEvt()==true){
				System.out.println("Date Arriv�e "+evenementaRemove.getDate()+ " Arriv�e "+" client #"+evenementaRemove.getNumero());
			}
			else if(debug == 1 && evenementaRemove.getTypeEvt()==false){
				System.out.println("Date D�part "+evenementaRemove.getDate()+ " D�part "+" client #"+evenementaRemove.getNumero() + " Date Arriv�e "+ evenementaRemove.getDate2());
			}
			//On enl�ve l'�v�nement choisi
			remove(count);
		}
		
		//Ici on va supprimer 1 �l�ment de plus si liste devient trop grosse
		if(size()>100){
			evenementaRemove=get(0);
			int count = 0;
			double loop = evenementaRemove.getDate();
			if(evenementaRemove.getTypeEvt()==false){
				boolean boucle = false;
				//Si l'�ch�ancier n'est pas trop petit, on regarde les valeurs d'apr�s jusqu'a trouver une arriv�e
				//car les autres d�part ne peuvent qu'�tre sup�tieurs, si l'arriv�e est sup�rieur on supprime
				//le d�part, sinon on supprime l'arriv�e
				while(boucle == false){
					count=count+1;
					evenementaRemove=get(count);
					boucle = evenementaRemove.getTypeEvt();
				}
				
				if(evenementaRemove.getDate()>=loop) {
					count=0;
					evenementaRemove=get(count);
				}
				
				//On ajoute le nombre de clients qu'il y a dans le syst�me
				Statistiques.additionNombreClientsDansSysteme(count);

			}
			if(debug == 1 && evenementaRemove.getTypeEvt()==true){
				System.out.println("Date Arriv�e "+evenementaRemove.getDate()+ " Arriv�e "+" client #"+evenementaRemove.getNumero());
			}
			else if( debug == 1 && evenementaRemove.getTypeEvt()==false){
				System.out.println("Date D�part "+evenementaRemove.getDate()+ " D�part "+" client #"+evenementaRemove.getNumero() + " Date Arriv�e "+ evenementaRemove.getDate2());
			}
			remove(count);
		}
		//On return true tant que l'horloge n'a pas �t� d�pass�e
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