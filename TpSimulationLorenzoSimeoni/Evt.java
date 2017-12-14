
public class Evt {
	
	//stocke le type d'événements True = arrivée, False = Départ
	private boolean typeEvt;
	
	//Stocke la date de l'évènement
	private double date;
	
	//Stocke le numéro (n) de l'évènement 
	private int numero = 0; 
	
	//Stocke la date d'arriv� pour un d�part
	private double date2;
	
	//Constucteur par défault
	public Evt(){
		this.typeEvt = true; //on mets � true si l'�v�nement est "arriv�e"
		this.date = 0.0; 
		this.numero = numero + 1; 
		this.date2 = 0.0;
	}
	
	//Constructeur avec param�tres
	public Evt(boolean ptypeEvt, double pdate,double pdate2, int pnumero){
		this.typeEvt = ptypeEvt;
		this.date = pdate;

		if(ptypeEvt == true){
			this.numero = pnumero + 1;	//on incr�mente que si c'est une arriv�e
		}
		else {
			this.numero = pnumero;//sinon on le laisse tel quel
		}

		this.date2=pdate2;

	}
	
	//fonctions utiles pour accéder aux valeurs des 
	//variables et les changer si nécessaires
	public boolean getTypeEvt() {
		return typeEvt;
	}

	public void setTypeEvt(boolean typeEvt) {
		this.typeEvt = typeEvt;
	}
	public double getDate() {
		return date;
	}

	public void setDate(double date) {
		this.date = date;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
	public double getDate2() {
		return date2;
	}
	
}
