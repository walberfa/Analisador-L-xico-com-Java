package analisadorLexico;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
%%

%{
  private File output;
  private File tabelaIdentificadores;
  private FileWriter writerOutput;
  private FileWriter writerIdentificadores;
  private int idCount = 0;
  private Map<Integer, String> mapIdentifier = new HashMap<>();

  public void fecharWriters() throws IOException {
    this.writerOutput.close();
  }

  private void imprimirId(String descricao, String lexema) throws IOException {
    int key = this.idCount;
	boolean exists = false;
    for (Map.Entry<Integer, String> entry : mapIdentifier.entrySet()) {
      if(entry.getValue().equals(lexema)) {
		key = entry.getKey();
		exists = true;
		break;
	  }
	}
	if (!exists) {
	  insertId(lexema); 
	  this.writerIdentificadores.append("key " + key + ": " + lexema + "\n");
	}
	System.out.println(lexema + " - " + "chave número " + key + " - " + descricao);
	this.writerOutput.append(lexema + " - " + "chave número " + key + " - " +  descricao + "\n");
  }
  
  private void imprimir(String descricao, String lexema) throws IOException {
    System.out.println(lexema + " - " + descricao);
    this.writerOutput.append(lexema + " - " + descricao + "\n");
  }
  
  private void insertId(String nome) {
	  mapIdentifier.put(idCount++, nome);
  }

  LexicalAnalyzer(java.io.Reader in, String inputname) throws IOException {
	String rootPath = Paths.get("").toAbsolutePath().toString();
	this.output = new File(rootPath + "\\" + inputname +" - output.txt");
	this.tabelaIdentificadores = new File(rootPath + "\\" + inputname +" - tabela de simbolos.txt");
	output.delete();
	output.createNewFile();
	tabelaIdentificadores.delete();
	tabelaIdentificadores.createNewFile();
	this.writerOutput = new FileWriter(this.output);
	this.writerIdentificadores = new FileWriter(this.tabelaIdentificadores);
	this.zzReader = in;
  }
%}


%class LexicalAnalyzer
%type void
%unicode

KEYWORDS1 = "abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"|"continue"|"default"|"double"
KEYWORDS2 = "do"|"else"|"enum"|"extends"|"false"|"final"|"finally"|"float"|"for"|"goto"|"if"|"implements"|"import"
KEYWORDS3 = "instanceof"|"int"|"interface"|"long"|"native"|"new"|"null"|"package"|"private"|"protected"|"public"|"return"|"short"
KEYWORDS4 = "static"|"strictfp"|"super"|"switch"|"synchronized"|"this"|"throw"|"throws"|"transient"|"true"|"try"|"void"|"volatile"|"while"
TODAS_KEYWORDS_RESERVADAS = {KEYWORDS1}|{KEYWORDS2}|{KEYWORDS3}|{KEYWORDS4}
LITERAL = "null"|"false"|"true"
TIPO = "byte"|"char"|"double"|"float"|"int"|"long"|"short"|"void"
DESVIO_CONDICIONAL_WORD = "case"|"else"|"if"|"switch"
LOOP_WORD = "for"|"while"|"do"
EXCECAO_WORD = "catch"|"finally"|"throw"|"throws"|"try"
ACESSO = "default"|"private"|"protected"|"public"
TIPO_STRING = "String"
OP_INSTANCIA = "instanceof"
OP_ANOTACAO = "@"
ANOTACAO = {OP_ANOTACAO}{ANY_CHAR}*

ESCAPE = ["\t"|"\b"|"\n"|"\r"|"\f"|"\'"|"\""|"\\"]
BRANCO = [\n|\s|\t|\r]+
ASPA_SIMPLES = [']
ASPA_DUPLA = \"
PONTO = \.
ANY_CHAR = .
VIRGULA = ","
OP_TERNARIO = "?"
DOIS_PONTOS = ":"
PONTO_E_VIRGULA = ";"
ABRE_PARENTESE = "("
FECHA_PARENTESE = ")"
ABRE_COLCHETE = "["
FECHA_COLCHETE = "]"
ABRE_CHAVE = "{"
FECHA_CHAVE = "}"
OP_ATRIBUICAO = ({OP_ARITMETICO}|{OP_SHIFT}|{OP_BIT})?"="
OP_ARITMETICO = "+"|"-"|"*"|"/"|"%"
OP_COMPARATIVO = "<"|">"|"<="|">="|"=="|"!="|{OP_INSTANCIA}
OP_LOGICO = "&&"|"||"|"!"
OP_UNARIO = "++"|"--"|"~"
OP_SHIFT = "<<"|">>"|">>>"
OP_BIT = "&"|"|"|"^"
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

CHAR = {ASPA_SIMPLES}({ANY_CHAR}|{ESCAPE}){ASPA_SIMPLES}
STRING = {ASPA_DUPLA}([^\"])*{ASPA_DUPLA}
NUM = "0"|[1-9][0-9]*
INTEIRO = "\-"?{NUM}
FLOAT = ({INTEIRO})?{PONTO}{NUM}

CONSTANTE = {LITERAL}|{CHAR}|{STRING}|{INTEIRO}|{FLOAT}

DEC_ARRAY = {TIPO}{BRANCO}*{ID}?{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{FECHA_COLCHETE}
DEC_MATRIZ = {TIPO}{BRANCO}*{ID}?{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{NUM}?{BRANCO}*{FECHA_COLCHETE}{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{FECHA_COLCHETE}

POS_ARRAY = {ID}{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{NUM}{BRANCO}*{FECHA_COLCHETE}
POS_MATRIZ = {ID}{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{NUM}{BRANCO}*{FECHA_COLCHETE}{BRANCO}*{ABRE_COLCHETE}{BRANCO}*{NUM}{BRANCO}*{FECHA_COLCHETE}

CONST_ARRAY = {ABRE_CHAVE}{BRANCO}*((({CONSTANTE}|{ID}){BRANCO}*{VIRGULA}{BRANCO}*)*({CONSTANTE}|{ID}))?{BRANCO}*{FECHA_CHAVE}
CONST_MATRIZ = {ABRE_CHAVE}{BRANCO}*((({CONST_ARRAY}|{ID}){BRANCO}*{VIRGULA}{BRANCO}*)*({CONST_ARRAY}|{ID}))?{BRANCO}*{FECHA_CHAVE}

DESVIO_CONDICIONAL = ("if"|"switch"){BRANCO}*{ABRE_PARENTESE}
LOOP = ("for"|"while"){BRANCO}*{ABRE_PARENTESE}
EXCECAO = "catch"{BRANCO}*{ABRE_PARENTESE}
METODO = {ID}{BRANCO}*{ABRE_PARENTESE}

COMENTARIO = (["//"]({ANY_CHAR})*)|("/*"([^*]|\*+[^*/])*\*+"/")

%%

{ACESSO}						{ imprimir("Palavra reservada " + yytext() + " (modificador de acesso)", yytext()); }
{EXCECAO_WORD}					{ imprimir("Palavra reservada " + yytext() + " (exceção)", yytext()); }
{LOOP_WORD}						{ imprimir("Palavra reservada " + yytext() + " (loop)", yytext()); }
{DESVIO_CONDICIONAL_WORD}		{ imprimir("Palavra reservada " + yytext() + " (desvio condicional)", yytext()); }
{TIPO}							{ imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
{TIPO_STRING}					{ imprimir("Tipo não primitivo " + yytext(), yytext()); }
{LITERAL}						{ imprimir("Palavra reservada " + yytext() + " (valor literal)", yytext()); }
{TODAS_KEYWORDS_RESERVADAS}		{ imprimir("Palavra reservada " + yytext(), yytext()); }


{COMENTARIO}					{ imprimir("Comentário", yytext()); }
{ABRE_CHAVE}					{ imprimir("Chave aberta", yytext()); }
{FECHA_CHAVE}					{ imprimir("Chave fechada", yytext()); }
{ABRE_COLCHETE}					{ imprimir("Colchete aberto", yytext()); }
{FECHA_COLCHETE}				{ imprimir("Colchete fechado", yytext()); }
{ABRE_PARENTESE}				{ imprimir("Parêntese aberto", yytext()); }
{FECHA_PARENTESE}				{ imprimir("Parêntese fechado", yytext()); }
{PONTO}							{ imprimir("Separador ponto", yytext()); }
{DOIS_PONTOS}					{ imprimir("Separador dois-pontos", yytext()); }
{PONTO_E_VIRGULA}				{ imprimir("Separador ponto e vírgula", yytext()); }
{BRANCO}                    	{}
{DEC_MATRIZ}					{ imprimir("Declaração de matriz", yytext()); }
{DEC_ARRAY}						{ imprimir("Declaração de array", yytext()); }
{POS_MATRIZ}					{ imprimir("Posição da matriz", yytext()); }
{POS_ARRAY}						{ imprimir("Posição do array", yytext()); }
{CONST_MATRIZ}					{ imprimir("Constante de uma matriz", yytext()); }
{CONST_ARRAY}					{ imprimir("Constante de um array", yytext()); }
{OP_ATRIBUICAO}					{ imprimir("Operador de atribuição", yytext()); }
{OP_ARITMETICO}					{ imprimir("Operador aritmético", yytext()); }
{OP_LOGICO}						{ imprimir("Operador lógico", yytext()); }
{OP_BIT}						{ imprimir("Operador de bits", yytext()); }
{OP_SHIFT}						{ imprimir("Operador de shift", yytext()); }
{OP_UNARIO}						{ imprimir("Operador unário", yytext()); }
{OP_TERNARIO}					{ imprimir("Operador ternário", yytext()); }
{OP_COMPARATIVO}				{ imprimir("Operador comparativo", yytext()); }
{INTEIRO}              		    { imprimir("Constante tipo número inteiro", yytext()); }
{CHAR}							{ imprimir("Constante tipo char", yytext()); }
{FLOAT}							{ imprimir("Constante tipo float", yytext()); }
{STRING}						{ imprimir("Constante tipo string", yytext()); }
{ANOTACAO}						{ imprimir("Anotação do java", yytext()); }
{VIRGULA}						{ imprimir("Separador vírgula", yytext()); }
{DESVIO_CONDICIONAL}			{ imprimir("Estrutura de desvio condicional", yytext()); }
{LOOP}							{ imprimir("Estrutura de loop", yytext()); }
{EXCECAO}						{ imprimir("Estrutura de exceção", yytext()); }
{METODO}						{ imprimirId("Método", yytext()); }
{ID}                	        { imprimirId("Identificador", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }
