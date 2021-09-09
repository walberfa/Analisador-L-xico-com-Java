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
PONTO= \.
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
"if"                         { imprimir("Palavra reservada if", yytext()); }
{BRANCO}                     { imprimir("Espaço em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}                         { imprimir("Operador de soma", yytext()); }
{INTEIRO}                     { imprimir("Constante tipo número inteiro", yytext()); }
{CHAR}				{ imprimir("Constante tipo char", yytext()); }
. { throw new RuntimeException("Caractere inválido " + yytext()); }
