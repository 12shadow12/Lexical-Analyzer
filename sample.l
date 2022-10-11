%{
    /* Definitions Section */

    int count = 0;
%}

/* Rules Section */
%%
[ \t\n\r]+  /* skip whitespace, tabulation and carriage return character*/

"if"|"else"|"while"|"for"|"int"|"main"|"cout"|"return" {printf("%s KEYWORD\n", yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {printf("%s IDENTIFIER\n", yytext);
       count++;}
\"([^\\\"]|\\.)*\" {printf("%s STRING LITERAL\n", yytext);}
[(,)] {printf("%s SEPARATOR\n", yytext);}
[-+*/<>=] {printf("%s OPERATOR\n", yytext);}
"<="|">="|"==" {printf("%s OPERATOR\n", yytext);}
[0-9]+ {printf("%s INTEGER\n", yytext);}
[0-9]+[.][0-9]+ {printf("%s REAL\n", yytext);}
";"|"{"|"}"|"["|"]" {printf("%s PUNCTUATION\n", yytext);}
. {printf("%s Invalid character\n", yytext);}
"//".*  { /* DO NOTHING */ }

%%

/* User routines Section */
int yywrap() {}

int main()
{

  // Open the text file
  FILE *myfile = fopen("input_sourcecode.txt", "r");
  if (!myfile)
  {
    perror("I can't open the file!\n");
    return -1;
  }

  // Set lex to read from the file
  yyin = myfile;


  yylex();
  printf("\nNumber of Identifiers "
      "in the given input - %d\n", count);


    return 0;
}
