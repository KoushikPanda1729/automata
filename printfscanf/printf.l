%{
#include <stdio.h>
%}

%%
abc    { printf("ABC"); }
.      { putchar(yytext[0]); }
%%

int main() {
    printf("Enter your input: ");
    
    yylex();

    return 0;
}
