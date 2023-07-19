%{
#include <stdio.h>
%}

DIGIT       [0-9]
NUMBER      {DIGIT}+(\.{DIGIT}+)?   

%%
    {NUMBER}    { printf("Number: %s\n", yytext); }
    \+          { /* Addition symbol */ return '+'; }
    \n          { /* Newline character */ return '\n'; }
    [ \t]       ; /* Ignore whitespace */
    .           { printf("Invalid character: %c\n", *yytext); }
%%

int main() {
    yylex();
    return 0;
}
