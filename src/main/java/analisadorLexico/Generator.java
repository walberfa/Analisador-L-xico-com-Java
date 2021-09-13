package analisadorLexico;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Paths;

import jflex.exceptions.SilentExit;


public class Generator {//UTILIZE APENAS PARA GERAÇÃO DO LEXANALYZER.JAVA. PARA CHAMADA DESTE, UTILIZE ANALISADOR.JAVA COMO MAIN CLASS

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
