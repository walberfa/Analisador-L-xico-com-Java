package analisadorLexico;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Paths;
import java.util.Scanner;


public class Analisador {

	private static void enterParaSair(int flag) {
		Scanner scn = new Scanner(System.in);
		if (flag == 1)	System.out.println("Output e Tabela escritos nesta pasta");
		System.out.println("Pressione ENTER para sair");
		scn.nextLine();
		scn.close();
		System.exit(0);
	}
	
	public static void main(String[] args) {

		if (Array.getLength(args) != 1) {
			System.out.println("ERRO: informe apenas o parâmetro do nome do arquivo");
			enterParaSair(0);
		}

		String inputPath = Paths.get("").toAbsolutePath().toString() + "\\";
		File input = new File(inputPath + args[0]);
		System.out.println(inputPath + args[0]);
		if (!input.exists()) {
			System.out.println("ERRO: arquivo não existe");
			enterParaSair(0);
		}

		LexicalAnalyzer lexicalAn;

		try {
			lexicalAn = new LexicalAnalyzer(new FileReader(input), args[0]);
			lexicalAn.yylex();
			lexicalAn.fecharWriters();
		} catch (IOException e1) {
			System.out.print("ERRO: ");
			e1.printStackTrace();
		}
		enterParaSair(1);
	}
}
