//Classe tr�s importantes car elle contient toutes les valeurs th�oriques et exp�rimentales
//importantes pour le TP

public class Stats {
	
	double ro;
	double nbTotalClientsAttendus;
	double ProbServiceSansAttente;
	double ProbFileOccup�e;
	double Debit;
	double EspnbClients;
	double TempsMoyenSejour;
	double NombreTotalClient;
	double PropclientsSansAttente;
	double PropClientsAvecAttente;
	double DebitE;
	double NombreClientsDansSysteme;
	double TempsMoyenSejourE;
	
	Stats(){
		ro = 0;
		nbTotalClientsAttendus = 0;
		ProbServiceSansAttente=0;
		ProbFileOccup�e=0;
		Debit=0;
		EspnbClients=0;
		TempsMoyenSejour=0;
		NombreTotalClient=0;
		PropclientsSansAttente=0;
		PropClientsAvecAttente=0;
		DebitE=0;
		NombreClientsDansSysteme=0;
		TempsMoyenSejourE=0;
	}
	//on calcule dans le constructeur toutes les valeurs th�oriques et on initialise les valeures exp�rimentales 
	//� 0
	Stats(double lambda, double mu,double duree){
		ro = lambda/mu;
		nbTotalClientsAttendus = lambda*duree;
		ProbServiceSansAttente=1-ro;
		ProbFileOccup�e=ro;
		Debit=lambda;
		EspnbClients=ro/(1-ro);
		TempsMoyenSejour=1/(mu*(1-ro));
		NombreTotalClient=0;
		PropclientsSansAttente=0;
		PropClientsAvecAttente=0;
		DebitE=0;
		NombreClientsDansSysteme=0;
		TempsMoyenSejourE=0;
	}
	public double getRo() {
		return ro;
	}
	public double getProbServiceSansAttente() {
		return ProbServiceSansAttente;
	}
	public double getProbFileOccup�e() {
		return ProbFileOccup�e;
	}
	public double getDebit() {
		return Debit;
	}
	public double getEspnbClients() {
		return EspnbClients;
	}
	public double getTempsMoyenSejour() {
		return TempsMoyenSejour;
	}

	public void setRo(double pro) {
		this.ro = pro;
	}
	public double getnbTotalClientsAttendus() {
		return nbTotalClientsAttendus;
	}

	public void setnbTotalClientsAttendus(double pnbTotalClientsAttendus) {
		this.nbTotalClientsAttendus = pnbTotalClientsAttendus;
	}
	public double getNombreTotalClient() {
		return NombreTotalClient;
	}

	public void setNombreTotalClient(double pNombreTotalClient) {
		this.NombreTotalClient = pNombreTotalClient;
	}
	public void Incr�menterNombreTotalClient() {
		this.NombreTotalClient = NombreTotalClient + 1;
	}
	public void setDebitE(double pDebitE){
		DebitE=pDebitE;
	}
	public double getDebitE(){
		return DebitE;
	}
	public void setPropClientsSansAttente(double pPropclientsSansAttente){
		PropclientsSansAttente=pPropclientsSansAttente;
	}
	public void IncrementerPropClientsSansAttente(){
		PropclientsSansAttente= PropclientsSansAttente+1;
	}
	public double getPropClientsSansAttente(){
		return PropclientsSansAttente;
	}
	public void setPropClientsAvecAttente(double pPropClientsAvecAttente){
		PropClientsAvecAttente=pPropClientsAvecAttente;
	}
	public void IncrementerPropClientsAvecAttente(){
		PropClientsAvecAttente=PropClientsAvecAttente+1;
	}
	public double getPropClientsAvecAttente(){
		return PropClientsAvecAttente;
	}
	
	public double getTempsMoyenSejourE(){
		return TempsMoyenSejourE;
	}
	public void setTempsMoyenSejourE(double pTempsMoyenSejourE){
		TempsMoyenSejourE=pTempsMoyenSejourE;
	}
	public void additionTempsMoyenSejourE(double pTempsMoyenSejourE){
		TempsMoyenSejourE=TempsMoyenSejourE + pTempsMoyenSejourE;
	}
	public void soustractionTempsMoyenSejourE(double pTempsMoyenSejourE){
		TempsMoyenSejourE=TempsMoyenSejourE - pTempsMoyenSejourE;
	}
	public double getNombreClientsDansSysteme(){
		return NombreClientsDansSysteme;
	}
	public void setNombreClientsDansSysteme(double pNombreClientsDansSysteme){
		NombreClientsDansSysteme=pNombreClientsDansSysteme;
	}
	public void additionNombreClientsDansSysteme(double pNombreClientsDansSysteme){
		NombreClientsDansSysteme=NombreClientsDansSysteme+pNombreClientsDansSysteme;
	}
	
}
