//classe qui permet de faire les 2 opérations utiles pour calculer les temps d'arrivé du prochain client 
//et le temps de service du client

public class Utile {

	private double lambda;
	private double mu;
	
	public Utile(){
		this.lambda = 1;
		this.mu = 1;
	}
	
	public Utile(double plambda, double pmu){
		this.lambda = plambda;
		this.mu = pmu;
	}
	
	public double TempsArrive(double x){
		return -Math.log(1-x)/mu ;
	}
	
	public double TempsService(double x){
		return -Math.log(1-x)/lambda; 
	}
	
}
