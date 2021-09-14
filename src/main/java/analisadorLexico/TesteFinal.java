package analisadorLexico;

public class TesteFinal {
	public static void main(String[] args) {
		// Esse teste tem o intuito de ser complexo
		/*
		 * O intuito é utilizar várias estruturas
		 * para fazer um teste de exaustão no analisador 
		 */
		
		double linfocitos = 0.5;
		double plaquetas = 100002.39;
		
		if (analisar(plaquetas, linfocitos) < 0.30) {
			System.out.println("A pessoa analisada pode ter dengue");
		} else if (analisar(plaquetas, linfocitos) > 0.80) {
			System.out.println("A pessoa analisada pode ter leucemia");
		} else {
			System.out.println("A pessoa analisada está devidamente saudável");
		}
		
		double[] conjuntoLinfocitos = { 5.2, 7.3, 1.4 };
		double[] conjuntoPlaquetas = { 80000, 40000.2, 14000.87 };
		double[] conjuntoAnalises = new double[conjuntoLinfocitos.length];
		int i = 0;
		while (i < conjuntoLinfocitos.length) {
			conjuntoAnalises[i] = analisar(conjuntoPlaquetas[i], conjuntoLinfocitos[i]);
		}
		
	}
	
	/***
	 * Este método faz a análise das plaquetas e dos linfocitos
	 * @param plaquetas
	 * @param linfocitos
	 * @return
	 */
	private static double analisar(double plaquetas, double linfocitos) {
		return plaquetas * linfocitos / 1000;
	}
}
