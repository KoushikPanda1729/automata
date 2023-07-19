%{
#include <stdio.h>
int simple_count = 0;
int compound_count = 0;
int brace_count = 0;
%}

%%
"{"        { brace_count++; }
"}"        { brace_count--;
             if (brace_count == 0) {
                 compound_count++;
             }
           }
";"        { if (brace_count == 0) {
                 simple_count++;
             }
           }
.          { /* Ignore other characters */ }
\n         { /* Ignore newlines */ }
%%

int main() {
    yylex();
    printf("Number of simple statements: %d\n", simple_count);
    printf("Number of compound statements: %d\n", compound_count);
    return 0;
}
