package analisadorLexico;

public class TesteOperadores {
	public static void main(String[] args) {
		int numA = 5;
		long numB = numA * 2;
		
		numB <<= numA; 
		long numC = (numB % 2 == 0 && numA % 5 == 0) ? (numA / 5) >> 2 : (numB - 2) | 7;
		
		boolean bool1 = numC % 3 != 0;
		
		bool1 ^= (numA != numB || numA != numC) ? false : true;
		
		double doubX = (!bool1) ? (numA++ * 8 - 5) : (numB & numC);
		
		numB = (-doubX <= numA) ? (--numA) : ((numB >= numC) ? (--numC * 4) : (+numC / 3));
	}
}
