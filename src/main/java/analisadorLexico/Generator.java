package analisadorLexico;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Paths;

import jflex.exceptions.SilentExit;


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

		if (Array.getLength(args) != 1) {
			System.out.println("ERRO: informe apenas o parâmetro do nome do arquivo");
			return;
		}
		
		String inputPath = Paths.get("").toAbsolutePath().toString() + "\\exemplo\\";
		File input = new File(inputPath + args[0]);
		if (!input.exists()) {
			System.out.println("ERRO: arquivo não existe");
			return;
		}
		
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
