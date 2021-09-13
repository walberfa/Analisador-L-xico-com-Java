package analisadorLexico;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Paths;


public class Analisador {

	public static void main(String[] args) {

		if (Array.getLength(args) != 1) {
			System.out.println("ERRO: informe apenas o parâmetro do nome do arquivo");
			return;
		}

		String inputPath = Paths.get("").toAbsolutePath().toString() + "\\";
		File input = new File(inputPath + args[0]);
		System.out.println(inputPath + args[0]);
		if (!input.exists()) {
			System.out.println("ERRO: arquivo não existe");
			return;
		}

		LexicalAnalyzer lexicalAn;

		try {
			lexicalAn = new LexicalAnalyzer(new FileReader(input), args[0]);
			lexicalAn.yylex();
			lexicalAn.fecharOutput();
		} catch (IOException e1) {
			System.out.print("ERRO: ");
			e1.printStackTrace();
		}
		try {
			System.out.println("Pressione ENTER para sair");
			System.in.read();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
