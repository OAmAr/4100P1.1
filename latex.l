%{ /* THIS IS LATEX.L */


#include <stdio.h>
#define  TBEGIN  	        200
#define  TEND 		        201
#define  TDOCUMENT	        202
#define  TWORD              203
#define  TBACKSL	        204
#define	 TLCURLYB	        205
#define  TRCURLYB	        206
#define  TTABLESPEC 	    207
#define  TCOLSPEC	        208
#define  TSECTION	        209
#define  TSUBSECTION	    210
#define  TTABLEOFCONTENTS	211
#define  TRENEWCOMMAND	    212
#define  TPAGENUMBERING	    213
#define  TARABIC	        214
#define  TROMAN	            215
#define  TALPH	            216
#define  TRoman	            217
#define  TAlph	            218
#define  TVSPACE	        219
#define  THASPACE	        220
#define  TRM	            221
#define  TIT	            222
#define  TDOLLAR            223
#define  TAND	            224
#define  THASH	            225
#define  TUNDERSCORE        226
#define  TVERBATIM	        228
#define  TCENTER	        229
#define  TSINGLE	        230
#define  TITEMIZE	        231
#define  TITEM	            232
#define  TNOINDENT	        233
#define  TENUMERATE	        234
#define  TINT               235
#define  TSTYLE             236
#define  TCOUNT             237
#define  TDBACK             238
#define  TSTRING            239
#define  TCAPTION           240
#define  TLABEL             241
#define  TTABLE             242
#define  TTABULAR           243
//ENDDEF

/*

Questions
    does int need to be more specific??
    Strings??
    Counters???
*/


%}
ws		        [ \t\n]+
word		    ([a-zA-Z0-9])*
tablespec       \[(h|t|b)\]
colspec         (c|l|r)+
int             ([0-9])* 
counter         \{(1[0-9]?|2[0-6]?|[1-9])\}   
STYLE           \{arabic|roman|alph|Roman|Alph|\}
string          \{([ -"]|['-Z]|[`-z]|(\\([#-&]|\[|[\]-\_]|[\{-~])))*\}
%%
"\\\\"			    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TDBACK, yytext);return(TDBACK);}
"\\"			    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TBACKSL, yytext);return(TBACKSL);}
"{"	    	    	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TLCURLYB, yytext);return(TLCURLYB);}
"}"		        	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TRCURLYB, yytext);return(TRCURLYB);}
"\{table\}"      	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TTABLE, yytext);return(TTABLE);}
"\{tabular\}"      	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TTABULAR, yytext);return(TTABULAR);}
"\\caption"        	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TCAPTION, yytext);return(TCAPTION);}
"\\label"         	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TLABEL, yytext);return(TLABEL);}
"\\begin"	    	{printf(" Val: %d\t; Lexeme: %s \n", 
				    TBEGIN, yytext);return(TBEGIN);}
"\{document\}"	    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TDOCUMENT, yytext);return(TDOCUMENT);}
"\\end"			    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TEND, yytext);return(TEND);}
"\{enumerate\}"		{printf(" Val: %d\t; Lexeme: %s \n", 
				    TENUMERATE, yytext);return(TENUMERATE);}
"\\noindent"		{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TNOINDENT, yytext);return(TNOINDENT);}
"\\item"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TITEM, yytext);return(TITEM);}
"\{itemize\}"		{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TITEMIZE, yytext);return(TITEMIZE);}
"\{single\}"		{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TSINGLE, yytext);return(TSINGLE);}
"\{center\}"		{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TCENTER, yytext);return(TCENTER);}
"\{verbatim\}"		{printf(" Val: %d\t; Lexeme: %s \n", 
				    TVERBATIM, yytext);return(TVERBATIM);}
"_"			        {printf(" Val: %d\t; Lexeme: %s \n", 
				    TUNDERSCORE, yytext);return(TUNDERSCORE);}
"#"			        {printf(" Val: %d\t; Lexeme: %s \n", 
				    THASH, yytext);return(THASH);}
"&"			        {printf(" Val: %d\t; Lexeme: %s \n", 
				    TAND, yytext);return(TAND);}
"$"			        {printf(" Val: %d\t; Lexeme: %s \n", 
			    	TDOLLAR, yytext);return(TDOLLAR);}
"\\it"		    	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TIT, yytext);return(TIT);}
"\\rm"		    	{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TRM, yytext);return(TRM);}
"\\hspace"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	THASPACE, yytext);return(THASPACE);}
"\\vspace"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TVSPACE, yytext);return(TVSPACE);}
"\\Alph"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TALPH, yytext);return(TALPH);}
"\\Roman"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TROMAN, yytext);return(TROMAN);}
"\\alph"			{printf(" Val: %d\t; Lexeme: %s \n", 
			    	TALPH, yytext);return(TALPH);}
"\\roman"			{printf(" Val: %d\t; Lexeme: %s \n", 
				    TROMAN, yytext);return(TROMAN);}
"\\arabic"			{printf(" Val: %d\t; Lexeme: %s \n", 
				    TARABIC, yytext);return(TARABIC);}
"\\pagenumbering"	{printf(" Val: %d\t; Lexeme: %s \n", 
    				TPAGENUMBERING, yytext);return(TPAGENUMBERING);}
"\\renewcommand"	{printf(" Val: %d\t; Lexeme: %s \n", 
				    TRENEWCOMMAND, yytext);return(TRENEWCOMMAND);}
"\\tableofcontents"	{printf(" Val: %d\t; Lexeme: %s \n", 
				    TTABLEOFCONTENTS, yytext);return(TTABLEOFCONTENTS);}
"\\subsection"		{printf(" Val: %d\t; Lexeme: %s \n", 
				    TSUBSECTION, yytext);return(TSUBSECTION);}
"\\section"			{printf(" Val: %d\t; Lexeme: %s \n", 
				    TSECTION, yytext);return(TSECTION);}
{counter}           {printf(" Val: %d\t; Lexeme: %s \n", 
				    TCOUNT, yytext);return(TCOUNT);}
{int}               {printf(" Val: %d\t; Lexeme: %s \n", 
				    TINT, yytext);return(TINT);}
{STYLE}             {printf(" Val: %d\t; Lexeme: %s \n", 
				    TSTYLE, yytext);return(TSTYLE);}
{tablespec}		    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TTABLESPEC, yytext);return(TTABLESPEC);}
{colspec}	    	{printf(" Val: %d\t; Lexeme: %s \n", 
				    TCOLSPEC, yytext);return(TCOLSPEC);}
{word}  		    {printf(" Val: %d\t; Lexeme: %s \n", 
				    TWORD, yytext);return(TWORD);}
{string}            {printf(" Val: %d\t; Lexeme: %s \n", 
				    TSTRING, yytext);return(TSTRING);}
{ws}                { /* DO NOTHING */ }


%%
/* need main routine at bottom */
int yywrap(){return 0;}

int main()
{
int i;
do { 
  i = yylex();
  printf("i is: %d ****\n", i);
} while (i!= -1);
return 0;
}

