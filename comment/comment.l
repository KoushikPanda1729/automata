%{
#include <stdio.h>

int commentLines = 0;
%}

%%

"/*"               { /* Start of multi-line comment */
                     commentLines++;
                     int nestedLevel = 1;
                     while (nestedLevel > 0) {
                         int c = getchar();
                         if (c == EOF)
                             break;
                         if (c == '/' && getchar() == '*')
                             nestedLevel++;
                         else if (c == '*' && getchar() == '/')
                             nestedLevel--;
                     }
                   }

"//"               { /* Start of single-line comment */
                     commentLines++;
                     while (getchar() != '\n') {
                         int c = getchar();
                         if (c == EOF)
                             break;
                     }
                   }

.|\n               { /* Ignore all other characters and newlines */ }

%%

int main() {
    printf("Enter your code (Ctrl+D on a new line to end input):\n");
    
    yyin = stdin;
    yylex();

    printf("Number of comment lines: %d\n", commentLines);

    return 0;
}

