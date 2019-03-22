%{

/*
   Lucas Morandi - 202031
   LAB 3 
   */

#include <stdio.h>
#include <string.h>

int email=0;
int unicamp=0;
int fee=0;

/* Criteiros de desempate:
   1 - Maior match
   2 - Regra que vem antes */
%}


LETRA   [a-zA-Z]
DIGITO  [0-9]
UNICAMP	(unicamp)
BR		(br)
FEE     (fee)
COM		(com)


PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+
EXTENSAO ({PALAVRA}[.])

%%

{PALAVRA}[@]{PALAVRA}*[.]*{FEE}[.]{UNICAMP}[.]{BR} { fee++; unicamp++; email++;/* printf("fee : %d\n", fee);*/}

{PALAVRA}[@]{PALAVRA}*[.]*{UNICAMP}[.]{BR} { unicamp++; email++;/* printf("unicamp : %d\n", unicamp);*/}

{INTEIRO}*{PALAVRA}[@]{EXTENSAO}*{PALAVRA}* { email++;/* printf("email : %d\n", email);*/} /* yytext e o texto que
                                                           deu match na
                                                           expressao regular */

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]*


%%

int main() {
  yylex();
  printf("%d %d %d\n", email, unicamp, fee);
  return 0;
}
