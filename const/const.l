%{
int constant_count = 0;
%}

digit     [0-9]+

%%
{digit}   { constant_count++; }
.         ; // Ignore any other characters.
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of constants: %d\n", constant_count);
    return 0;
}
