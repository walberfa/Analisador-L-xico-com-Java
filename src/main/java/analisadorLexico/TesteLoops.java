package analisadorLexico;

public class TesteLoops {
	public static void main(String[] args) {
		boolean controle = true;
		
		int i = 0, j = 1;
		while (controle) {
			if (i - j != 0) {
				break;
			}
			
			if (j > i) {
				j--;
			}
			
			if (i > j) {
				i--;
			}
		}
		
		for (i = 0; i < 6; i++) {
			i += 2;
			System.out.println(i);
		}
		
		do {
			i *= 2;
		} while (i % 8 != 0);
	}
}
