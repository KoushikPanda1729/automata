%{

#undef yywrap
#define yywrap() 1

%}

%%

f {
	printf("Hello World\n");	
}

	
%%

main()
{
	yylex(); //calling the rules section
}