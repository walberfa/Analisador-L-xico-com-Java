package analisadorLexico;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class LexicalAnalyzer
%type void

BACKSLASH = \\
BRANCO = [\n| |\t|\r]
ASPA_SIMPLES = (['])
ASPA_DUPLA = \"
PONTO = \.
ANY_CHAR = .
CHAR = {ASPA_SIMPLES}{ANY_CHAR}{ASPA_SIMPLES}
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA = [+]
INTEIRO = 0|[1-9][0-9]*
FLOAT = ({INTEIRO})?{PONTO}{INTEIRO}


%%

"abstract"					{ imprimir("Palavra reservada abstract", yytext()); }
"assert"					{ imprimir("Palavra reservada assert", yytext()); }
"boolean"					{ imprimir("Palavra reservada boolean", yytext()); }
"break"						{ imprimir("Palavra reservada break", yytext()); }
"byte"                       { imprimir("Palavra reservada byte (tipo)", yytext()); }
"case"			     { imprimir("Palavra reservada case (caso em desvio condicional)", yytext()); }
"catch"			     { imprimir("Palavra reservada catch", yytext()); }
"char"			     { imprimir("Palavra reservada char (tipo)", yytext()); }
"class"			     { imprimir("Palavra reservada class", yytext()); }
"const"			     { imprimir("Palavra reservada const", yytext()); }
"continue"			     { imprimir("Palavra reservada continue", yytext()); }
"default"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"double"			     { imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
"do"			     { imprimir("Palavra reservada " + yytext() + " (começo de loop)", yytext()); }
"else"			     { imprimir("Palavra reservada " + yytext() + " (continuação de desvio condicional)", yytext()); }
"enum"			     { imprimir("Palavra reservada " + yytext() + " (tipo não primitivo)", yytext()); }
"extends"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"false"			     { imprimir("Palavra reservada " + yytext() + " (valor booleano)", yytext()); }
"final"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"finally"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"float"			     { imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
"for"			     { imprimir("Palavra reservada " + yytext() + " (loop)", yytext()); }
"goto"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"default"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"double"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"do"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"if"                         { imprimir("Palavra reservada " + yytext() + " (condicional)", yytext()); }
"implements"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"import"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"instanceof"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"int"			     { imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
"interface"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"long"			     { imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
"native"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"new"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"null"			     { imprimir("Palavra reservada " + yytext() + " (valor nulo)", yytext()); }
"package"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"private"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"protected"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"public"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"return"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"short"			     { imprimir("Palavra reservada " + yytext() + " (tipo)", yytext()); }
"static"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"strictfp"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"super"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"switch"			     { imprimir("Palavra reservada " + yytext() + " (desvio condicional)", yytext()); }
"synchronized"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"this"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"throw"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"throws"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"transient"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"true"			     { imprimir("Palavra reservada " + yytext() + " (valor booleano)", yytext()); }
"try"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"void"			     { imprimir("Palavra reservada " + yytext() + " (tipo vazio)", yytext()); }
"volatile"			     { imprimir("Palavra reservada " + yytext(), yytext()); }
"while"			     { imprimir("Palavra reservada " + yytext() + " (loop)", yytext()); }


{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                         { imprimir("Operador de soma", yytext()); }
{INTEIRO}                     { imprimir("Constante tipo número inteiro", yytext()); }
{CHAR}				{ imprimir("Constante tipo char", yytext()); }
. { throw new RuntimeException("Caractere inválido " + yytext()); }
