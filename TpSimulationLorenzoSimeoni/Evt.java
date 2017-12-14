
public class Evt {
	
	//stocke le type d'Ã©vÃ©nements True = arrivÃ©e, False = DÃ©part
	private boolean typeEvt;
	
	//Stocke la date de l'Ã©vÃ¨nement
	private double date;
	
	//Stocke le numÃ©ro (n) de l'Ã©vÃ¨nement 
	private int numero = 0; 
	
	//Stocke la date d'arrivé pour un départ
	private double date2;
	
	//Constucteur par dÃ©fault
	public Evt(){
		this.typeEvt = true; //on mets à true si l'évènement est "arrivée"
		this.date = 0.0; 
		this.numero = numero + 1; 
		this.date2 = 0.0;
	}
	
	//Constructeur avec paramètres
	public Evt(boolean ptypeEvt, double pdate,double pdate2, int pnumero){
		this.typeEvt = ptypeEvt;
		this.date = pdate;

		if(ptypeEvt == true){
			this.numero = pnumero + 1;	//on incrémente que si c'est une arrivée
		}
		else {
			this.numero = pnumero;//sinon on le laisse tel quel
		}

		this.date2=pdate2;

	}
	
	//fonctions utiles pour accÃ©der aux valeurs des 
	//variables et les changer si nÃ©cessaires
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
