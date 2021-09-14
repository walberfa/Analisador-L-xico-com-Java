package analisadorLexico;

public class TesteDesviosCondicionais {
	public static void main(String[] args) {
		int i = 0, j;
		
		j = i * 4 >> 1;
		
		boolean controle = i - j != 0;
		
		if (controle) {
			if (i < 0) {
				j = -i * 5;
			}
		} else if (i > j) {
			i--;
		} else {
			i -= j;
		}
		
		switch (i++) {
			case 0:
				i = j - 1;
				break;
			case 4:
				i <<= 2;
				break;
			default:
				j = i;
		}
	}
}

