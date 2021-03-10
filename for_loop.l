%{
#include <stdio.h> 
#include "y.tab.h"
%}

Knostar [^*]*
Nostarfwd [^*/]
Pstar [\*]+
alphabet [A-Za-z_]
digit [0-9]

%%

[\t\n\ ]        									       ;
"/*"{Knostar}{Pstar}({Nostarfwd}{Knostar}{Pstar})*"/" 	   ;
"//".* 													   ;
for                         {return FOR;}
{digit}+                    {return DIGIT;}
{alphabet}({alphabet}|{digit})*   		{return ID;}
"<="                        {return LESS_EQ;} 
">="                        {return GRT_EQ;}
"=="                        {return EQ;}
"!="                        {return NOT_EQ;}
"||"                        {return OR;}
"&&"                        {return AND;}
{digit}+("++"|"--")|("++"|"--"){digit}+ 		{yyerror("lvalue is required as operand");}
.                           {return *yytext;}

%%


int yywrap()
{
    return 1;
}
