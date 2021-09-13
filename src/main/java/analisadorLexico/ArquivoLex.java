package analisadorLexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class ArquivoLex {

	public File lexDir;
	public File lexFile;
	
    public ArquivoLex() {
    	//Criando o arquivo .lex caso não exista. Se existir, ainda referencia-o.
        String rootPath = Paths.get("").toAbsolutePath(). toString();
        //String subPath = "\\src\\analisadorLexico\\";
        String filePath = rootPath + "\\";//subPath;
        
        lexDir = new File(filePath);
        if (!lexDir.exists())	lexDir.mkdir();
        
        lexFile = new File(filePath + "language.lex");
        try {
			lexFile.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
