%{
#include <stdio.h>
%}

%%
[a-z]    { printf("%c", yytext[0] - 32); }  /* Convert to uppercase */
.        { printf("%s", yytext); }           /* Print other characters as is */
\n       { printf("\n"); }                    /* Print newline */

%%

int main() {
    yylex();
    return 0;
}
