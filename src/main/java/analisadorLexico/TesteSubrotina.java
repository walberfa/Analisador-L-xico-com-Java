package analisadorLexico;

public class TesteSubrotina {
	public static void main(String[] args) {
		int a = 90124323;
		int b = 32910233;
		
		metodo("A soma entre " + a + " e " + b + " incrementada mais um equivale a " + soma(a, b));
	}
	
	private static void metodo(String teste) {
		System.out.println(teste + "\n");
	}
	
	private static int soma(int numA, int numB) {
		return numA + numB++;
	}
}
