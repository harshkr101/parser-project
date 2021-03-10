%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
extern FILE *yyout;
%}


%token ID DIGIT FOR LESS_EQ GRT_EQ EQ NOT_EQ OR AND  
%right '='
%left  OR AND
%left  LESS_EQ GRT_EQ EQ NOT_EQ '>' '<'
%left '+' '-'
%left '*' '/'
%left '!' '%'


%%
   
S           : START {printf("The for loop is VALID \n"); 
						exit(0);}

START       : FOR '(' EXP ';' EXP2 ';' EXP ')' DEF
            | FOR '(' ';'  ';' ')' DEF
            | FOR '(' EXP ';'  ';' ')' DEF
            | FOR '(' ';'EXP2  ';' ')' DEF
            | FOR '(' ';'  ';' EXP ')' DEF
            ;
            

DEF    	   :'{' '}'
           | '{' BODY '}'
           | EXP ';'
           | START
           | ID ID ';'
           |';'
           ;
           
BODY  	   : BODY START
           | BODY EXP ';'     
           | START
           | EXP ';'  
           | ID ID ';'
           |';'  
           ;
       
EXP       : ID '=' EXP
          | ID ID '=' EXP
          | EXP '+' EXP
          | EXP '-' EXP 
          | EXP '*' EXP 
          | EXP '/' EXP 
          | EXP '+' '+' 
          | EXP '-' '-' 
          | '+' '+' EXP 
          | '-' '-' EXP 
          | EXP '%' EXP 
          | ID 
          | EXP2
          ;

   
EXP2     : EXP'<'EXP
         | EXP'>'EXP
         | EXP LESS_EQ EXP
         | EXP GRT_EQ EXP
         | EXP EQ EXP
         | EXP NOT_EQ EXP
         | EXP OR EXP
         | EXP AND EXP
         | DIGIT
         ;   
%%


int yyerror(char const *s)
{
    printf("\nThe for loop is INVALID  %s\n",s);
    exit(1) ;
}

int main(int argc,char **argv) {
    yyin = fopen(argv[argc-1],"r");
    yyparse();
    return 1;
} 
