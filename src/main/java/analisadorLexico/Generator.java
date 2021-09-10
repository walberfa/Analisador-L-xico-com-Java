package analisadorLexico;

import jflex.exceptions.SilentExit;
import java.io.*;
import java.nio.file.Paths;


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

		String inputPath = Paths.get("").toAbsolutePath().toString() + "\\exemplo\\";
		File input = new File(inputPath + "input.txt");
        LexicalAnalyzer lexical;
		try {
			lexical = new LexicalAnalyzer(new FileReader(input));
			try {
				lexical.yylex();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
