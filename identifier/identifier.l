%{
int identifier_count = 0;
%}

letter    [a-zA-Z]
digit     [0-9]
identifier   ({letter}|_)(({letter}|{digit}|_)*)

%%
{identifier}   { identifier_count++; }
.              ; // Ignore any other characters.
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of identifiers: %d\n", identifier_count);
    return 0;
}
