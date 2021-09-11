package analisadorLexico;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
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
DESVIO_CONDICIONAL = "case"|"else"|"if"|"switch"
LOOP = "for"|"while"|"do"
EXCECAO = "catch"|"finally"|"throw"|"throws"|"try"
ACESSO = "default"|"private"|"protected"|"public"
TIPO_STRING = "String"

ESCAPE = ["\t"|"\b"|"\n"|"\r"|"\f"|"\'"|"\""|"\\"]
BRANCO = [\n| |\t|\r]
ASPA_SIMPLES = [']
ASPA_DUPLA = \"
PONTO = \.
ANY_CHAR = .
VIRGULA = ","
PONTO_E_VIRGULA = ";"
ABRE_PARENTESE = "("
FECHA_PARENTESE = ")"
ABRE_COLCHETE = "["
FECHA_COLCHETE = "]"
ABRE_CHAVE = "{"
FECHA_CHAVE = "}"
OP_ATRIBUICAO = "="
OP_ARITMETICO = "+"|"-"|"*"|"/"|"%"
OP_COMPARATIVO = "<"|">"|"<="|">="|"=="|"!="
OP_LOGICO = "&&"|"||"|"!"
OP_UNARIO = "++"|"--"
OP_BIT = "<<"|">>"|">>>"

ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

CHAR = {ASPA_SIMPLES}({ANY_CHAR}|{ESCAPE}){ASPA_SIMPLES}
STRING = {ASPA_DUPLA}([^\"])*{ASPA_DUPLA}
NUM = [0|[1-9][0-9]*]
INTEIRO = "\-"?{NUM}
FLOAT = ({INTEIRO})?{PONTO}{NUM}

CONSTANTE = {LITERAL}|{CHAR}|{STRING}|{INTEIRO}|{FLOAT}

DEC_ARRAY = {TIPO}{ABRE_COLCHETE}{FECHA_COLCHETE}
DEC_MATRIZ = {TIPO}{ABRE_COLCHETE}{NUM}?{FECHA_COLCHETE}{ABRE_COLCHETE}{FECHA_COLCHETE}

POS_ARRAY = {ID}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}
POS_MATRIZ = {ID}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}

CONST_ARRAY = {ABRE_CHAVE}((({CONSTANTE}|{ID})(" ")*{VIRGULA}(" ")*)*({CONSTANTE}|{ID}))?{FECHA_CHAVE}
CONST_MATRIZ = {ABRE_CHAVE}((({CONST_ARRAY}|{ID})(" ")*{VIRGULA}(" ")*)*({CONST_ARRAY}|{ID}))?{FECHA_CHAVE}

METODO = {ID}{ABRE_PARENTESE}({ANY_CHAR})*{FECHA_PARENTESE}

COMENTARIO = ("//"({ANY_CHAR})*)|("/*"({ANY_CHAR})*"*/")

%%

{ACESSO}						{ imprimir("Palavra reservada " + yytext() + " (modificador de acesso)", yytext()); }
{EXCECAO}						{ imprimir("Palavra reservada " + yytext() + " (exceção)", yytext()); }
{LOOP}							{ imprimir("Palavra reservada " + yytext() + " (loop)", yytext()); }
{DESVIO_CONDICIONAL}			{ imprimir("Palavra reservada " + yytext() + " (desvio condicional)", yytext()); }
{TIPO}							{ imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
{TIPO_STRING}					{ imprimir("Tipo não primitivo " + yytext(), yytext()); }
{LITERAL}						{ imprimir("Palavra reservada " + yytext() + " (valor literal)", yytext()); }
{TODAS_KEYWORDS_RESERVADAS}		{ imprimir("Palavra reservada " + yytext(), yytext()); }


{METODO}						{ imprimir("Método", yytext()); }
{COMENTARIO}					{ imprimir("Comentário", yytext()); }
{ABRE_CHAVE}					{ imprimir("Chave aberta", yytext()); }
{FECHA_CHAVE}					{ imprimir("Chave fechada", yytext()); }
{ABRE_COLCHETE}					{ imprimir("Colchete aberto", yytext()); }
{FECHA_COLCHETE}				{ imprimir("Colchete fechado", yytext()); }
{ABRE_PARENTESE}				{ imprimir("Parêntese aberto", yytext()); }
{FECHA_PARENTESE}				{ imprimir("Parêntese fechado", yytext()); }
{PONTO}							{ imprimir("Operador de ponto", yytext()); }
{BRANCO}                    	{ imprimir("Espaço em branco", yytext()); }
{DEC_MATRIZ}					{ imprimir("Declaração de matriz", yytext()); }
{DEC_ARRAY}						{ imprimir("Declaração de array", yytext()); }
{POS_MATRIZ}					{ imprimir("Posição da matriz", yytext()); }
{POS_ARRAY}						{ imprimir("Posição do array", yytext()); }
{CONST_MATRIZ}					{ imprimir("Constante de uma matriz", yytext()); }
{CONST_ARRAY}					{ imprimir("Constante de um array", yytext()); }
{OP_ATRIBUICAO}					{ imprimir("Operador de atribuição", yytext()); }
{PONTO_E_VIRGULA}				{ imprimir("Ponto e vírgula", yytext()); }
{OP_ARITMETICO}					{ imprimir("Operador aritmético", yytext()); }
{OP_LOGICO}						{ imprimir("Operador lógico", yytext()); }
{OP_BIT}						{ imprimir("Operador de bits", yytext()); }
{OP_UNARIO}						{ imprimir("Operador unário", yytext()); }
{INTEIRO}              		    { imprimir("Constante tipo número inteiro", yytext()); }
{CHAR}							{ imprimir("Constante tipo char", yytext()); }
{FLOAT}							{ imprimir("Constante tipo float", yytext()); }
{STRING}						{ imprimir("Constante tipo string", yytext()); }
{ID}                	        { imprimir("Identificador", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }
