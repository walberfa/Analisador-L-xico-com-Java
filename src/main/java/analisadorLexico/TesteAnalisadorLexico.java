package analisadorLexico;

import java.io.IOException;
import java.io.StringReader;

public class TesteAnalisadorLexico {
	public static void main(String[] args) {
		String expr = "if 2 + 3 a then";

		LexicalAnalyzer lexAn = new LexicalAnalyzer(new StringReader(expr));

		try {
			lexAn.yylex();			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
