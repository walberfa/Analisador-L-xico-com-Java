package analisadorLexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class ArquivoLex {

	public File lexDir;
	public File lexFile;

	/******
	 * basdfadf ******** asdgasd
	 * 
	 *
	 * saas
	 ****/
	public ArquivoLex() {
		String bob = "//";
		/* Criando o arquivo .lex caso não exista. Se existir, ainda referencia-o. */
		
		// Esse ´é um comentário de teste-chan
		
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
}