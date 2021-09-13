package analisadorLexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class ArquivoLex {

	public File lexDir;
	public File lexFile;

	/******
	 * Este é um
	 * comentário
	 de
	 *
	 * teste
	 ****/
	
	//////a qui tamvém é um comentário de String nova = "teste";
	public ArquivoLex() {
		String bob = "//";
		/*** Criando o arquivo .lex caso não exista. Se existir, ainda referencia-o. */
		
		// Esse ´é um comentário de teste-chan
		
		int holanda <<= 2;
		holanda++;
		
		holanda = -holanda;
		
		if (holanda > 8) {
			System.out.println("asasd");
		} else if (holanda instanceof String) {
			System.out.println("bsdbsd");
		} else {
			long menorah = holanda.length;
		}
		
		switch (holanda) {
			case 1:
				holanda++;
				break;
			case 2:
				holanda--;
				break;
			default:
				holanda *= 2;
		}
		
		do {
			holanda -= 2;
		} while (holanda <= 0);
		
		boolean bool = false;
		bool |= true;
		
		int trote = bool ? 4 : 8;
		
		int[] lista = {5, 6, 8, 7};
		
		for (int num : lista) {
			num++;
		}
		
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "\\exemplo\\";
		String filePath = rootPath + subPath;

		lexDir = new File(filePath);
		if (!lexDir.exists())
			lexDir.mkdir();

		lexFile = new File(filePath + "language.lex");
		try {
			lexFile.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void metodoTeste(int m, double n) {
		return;
	}
}