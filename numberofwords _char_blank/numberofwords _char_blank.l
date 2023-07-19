%{
#include <stdio.h>
int word_count = 0;
int char_count = 0;
int space_count = 0;
int line_count = 0;
%}

%%
[a-zA-Z]+       { word_count++; }
.               { char_count++; }
" "             { space_count++; }
\n              { line_count++; }

%%

int main() {
    yylex();
    printf("Number of words: %d\n", word_count);
    printf("Number of characters: %d\n", char_count);
    printf("Number of blank spaces: %d\n", space_count);
    printf("Number of lines: %d\n", line_count);
    return 0;
}
