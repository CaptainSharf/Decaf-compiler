%{
#include <iostream>
using namespace std;
#include "parser.tab.h"
#include <cstdlib>
#include <fstream>
#include <cstring>
#include <cmath>
#define YY_DECL extern "C" int yylex()

int flag=1;
char invalid;
void  yyerror(char *s);
unsigned long int text_to_i(char *s,int fl);
bool str_to_bool(char *s);
%}
DIGIT    [0-9]
HEX_DIGIT [0-9a-fA-F]
LETTER [a-zA-Z]
ALPHA {LETTER}|{DIGIT}
flag=1
%%
Program {return PROGRAM;}
this {return THIS;}
for {return FOR;}
if {return IF;}
else {return ELSE;}
"{" {return OPEN;}
"}" {return CLOSE;}
"break" {return BREAK;}
"continue" {return CONTINUE;}
"void" {return VOID;}
callout {return CALLOUT;}
class {return CLASS;}
int {return INT;}
boolean {return BOOL;}
"return" {return RETURN;}
";" {return SEMICOLON;}
"&&" {return AND;}
"||" {return OR;}
"=" {yylval.sval = strdup(yytext);return EQUALTO;}
"+=" {yylval.sval = strdup(yytext);return PLUSEQUAL;}
"-=" {yylval.sval = strdup(yytext);return MINUSEQUAL;}
true|false {yylval.boolval = str_to_bool(yytext);return BOOL_VAL;}
"," {return COMMA;}
"!" {return NOT;}
"(" {return OPEN_PAREN;}
")" {return CLOSE_PAREN;}
"[" {return OPEN_SQR;}
"]" {return CLOSE_SQR;}
">" {yylval.sval = strdup(yytext);return GREATERTHAN;}
">=" {yylval.sval = strdup(yytext);return GREATEREQUAL;}
"<" {yylval.sval = strdup(yytext);return LESSTHAN;}
"<=" {yylval.sval = strdup(yytext);return LESSEQUAL;}
"==" {yylval.sval = strdup(yytext);return EQUALEQUAL;}
"!=" {yylval.sval = strdup(yytext);return NOTEQUAL;}
\+ {yylval.sval = strdup(yytext);return PLUS;}
-  {yylval.sval = strdup(yytext);return MINUS;}
\* {yylval.sval = strdup(yytext);return MULTIPLY;}
\/ {yylval.sval = strdup(yytext);return DIVIDE;}
\% {yylval.sval = strdup(yytext);return MODULO;}
{LETTER}+ {yylval.sval = strdup(yytext);return ID;}
{DIGIT}+ {yylval.ival = text_to_i(yytext,0);return NUMBER;}
{LETTER}{ALPHA}* {yylval.sval = strdup(yytext);return ID;}
"0x"{HEX_DIGIT}+ {yylval.ival = text_to_i(yytext,1);return NUMBER;}
{HEX_DIGIT}+ {yylval.ival = text_to_i(yytext,1);return NUMBER;}
'([^'\\\n]|\\.)' {yylval.sval = strdup(yytext);return CHAR;}
\"(\\.|[^"])*\" {yylval.sval = strdup(yytext);return STRING;}
[ \t\n\r]+ ;
%%

void yyerror(char *s)
{
    printf("%s\n",s);
    exit(-1);
}

unsigned long int text_to_i(char *s,int fl)
{
    string strng = s;
    if(fl==1)
        return strtoul(strng.c_str(),NULL,16);
    else
        return strtoul(strng.c_str(),NULL,10);
}

bool str_to_bool(char *s)
{
    string strng = s;
    if(strng=="true")
        return true;
    else
        return false;
}