package analisadorLexico;

import jflex.SilentExit;

public class Generator {

	public static void main(String[] args) {
		ArquivoLex lex = new ArquivoLex();
		String[] lexPath = {lex.lexFile.getAbsolutePath()};
		try {
			jflex.Main.generate(lexPath);
		} catch (SilentExit e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
