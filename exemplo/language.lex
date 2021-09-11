package analisadorLexico;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class LexicalAnalyzer
%type void

(?# Palavras chave)
KEYWORDS1 = "abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"|"continue"|"default"|"double"
KEYWORDS2 = "do"|"else"|"enum"|"extends"|"false"|"final"|"finally"|"float"|"for"|"goto"|"if"|"implements"|"import"
KEYWORDS3 = "instanceof"|"int"|"interface"|"long"|"native"|"new"|"null"|"package"|"private"|"protected"|"public"|"return"|"short"
KEYWORDS4 = "static"|"strictfp"|"super"|"switch"|"synchronized"|"this"|"throw"|"throws"|"transient"|"true"|"try"|"void"|"volatile"|"while"
TODAS_KEYWORDS_RESERVADAS = {KEYWORDS1}|{KEYWORDS2}|{KEYWORDS3}|{KEYWORDS4}
LITERAIS = "null"|"false"|"true"
TIPOS = "byte"|"char"|"double"|"float"|"int"|"long"|"short"|"void"
DESVIOS_CONDICIONAIS = "case"|"else"|"if"|"switch"
LOOPS = "for"|"while"|"do"
EXCECOES = "catch"|"finally"|"throw"|"throws"|"try"
ACESSO = "default"|"private"|"protected"|"public"
KEYWORDS_GERAIS = ((((({TODAS_KEYWORDS_RESERVADAS}{-}{LITERALS}){-}{TIPOS}){-}{DESVIOS_CONDICIONAIS}){-}{LOOPS}){-}{EXCECOES}){-}{ACESSO}
TIPO_STRING = "String"

(?# Reconhecimento de caracteres e combinações)
ESCAPES = ["\t"|"\b"|"\n"|"\r"|"\f"|"\'"|"\""|"\\"]
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
OP_ARITMETICOS = "+"|"-"|"*"|"/"|"%"
OP_COMPARATIVOS = "<"|">"|"<="|">="|"=="|"!="
OP_LOGICOS = "&&"|"||"|"!"
OP_UNARIOS = "++"|"--"

ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

CHAR = {ASPA_SIMPLES}({ANY_CHAR}|{ESCAPES}){ASPA_SIMPLES}
STRING = {ASPA_DUPLA}([^\"])*{ASPA_DUPLA}
NUM = [0|[1-9][0-9]*]
INTEIRO = "\-"?{NUM}
FLOAT = ({INTEIRO})?{PONTO}{NUM}

CONSTANTE = {LITERAIS}|{CHAR}|{STRING}|{INTEIRO}|{FLOAT}

(?# DECLARAÇÃO ARRAYS)
DEC_ARRAY = {TIPO}{ABRE_COLCHETE}{FECHA_COLCHETE}
DEC_MATRIZ = {TIPO}{ABRE_COLCHETE}{NUM}?{FECHA_COLCHETE}{ABRE_COLCHETE}{FECHA_COLCHETE}

(?# VALOR DA POSIÇÃO DE ARRAYS)
POS_ARRAY = {ID}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}
POS_MATRIZ = {ID}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}{ABRE_COLCHETE}{NUM}{FECHA_COLCHETE}

(?# CONSTANTE DE ARRAYS)
CONST_ARRAY = {ABRE_CHAVE}((({CONSTANTE}|{ID})(" ")*{VIRGULA}(" ")*)*({CONSTANTE}|{ID}))?{FECHA_CHAVE}
CONST_MATRIZ = {ABRE_CHAVE}((({CONST_ARRAY}|{ID})(" ")*{VIRGULA}(" ")*)*({CONST_ARRAY}|{ID}))?{FECHA_CHAVE}

(?# OUTROS)
METODO = {ID}{ABRE_PARENTESE}({ANY_CHAR})*{FECHA_PARENTESE}

COMENTARIOS = ("//"({ANY_CHAR})*"\n")|("/*"({ANY_CHAR})*"*/")

%%

{KEYWORDS_GERAIS}				{ imprimir("Palavra reservada " + yytext(), yytext());}
{ACESSO}						{ imprimir("Palavra reservada " + yytext() + " (modificador de acesso)", yytext());}
{EXCECOES}						{ imprimir("Palavra reservada " + yytext() + " (exceção)", yytext());}
{LOOPS}						{ imprimir("Palavra reservada " + yytext() + " (loop)", yytext());}
{DESVIOS_CONDICIONAIS}						{ imprimir("Palavra reservada " + yytext() + " (desvio condicional)", yytext());}
{TIPOS}						{ imprimir("Palavra reservada " + yytext() + " (tipo)", yytext());}
{TIPO_STRING}				{ imprimir("Tipo não primitivo " + yytext(), yytext());}
{LITERAIS}						{ imprimir("Palavra reservada " + yytext() + " (valor literal)", yytext());}



{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                         { imprimir("Operador de soma", yytext()); }
{SUBTRACAO}						{ imprimir("Operador de subtração", yytext()); }
{DIVISAO}						{ imprimir("Operador de divisão", yytext()); }
{MULTIPLICACAO}						{ imprimir("Operador de multiplicação", yytext()); }
{MODULO}						{ imprimir("Operador de módulo", yytext()); }
{INTEIRO}                     { imprimir("Constante tipo número inteiro", yytext()); }
{CHAR}				{ imprimir("Constante tipo char", yytext()); }
{FLOAT}						{ imprimir("Constante tipo float", yytext()); }
{STRING}					{ imprimir("Constante tipo string", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }
