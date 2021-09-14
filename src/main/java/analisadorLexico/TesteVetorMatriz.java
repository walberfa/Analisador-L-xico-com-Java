package analisadorLexico;

public class TesteVetorMatriz {
	public static void main(String[] args) {
		int vetor[] = { 1, 2, 3, 7, 3, 4, 1 };
		
		int matriz[][] = {
				{2, 4, 8},
				{3, 5, 9},
				{4, 6, 10}
		};
		
		if (matriz[2][0] == vetor[5]) {
			System.out.println("O vetor e a matriz têm um elemento específico comum");
		}
	}
}
