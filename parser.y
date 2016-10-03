%{
#include <cstdio>
#include <iostream>
#include <fstream>
using namespace std;
extern "C" int yylex();
extern "C" int yyparse();
ofstream f;
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

%union{
	char *sval;
	int ival;
	bool boolval;
}
%define parse.error verbose
%token THIS OPEN CLOSE VOID PROGRAM
%token INT BOOL IF ELSE CLASS CALLOUT FOR OPEN_PAREN CLOSE_PAREN
%token CONT NOT MINUS OPEN_SQR CLOSE_SQR COMMA
%token <sval> ARITH_OP
%token <sval> EQ_OP
%token <sval> REL_OP
%token <sval> ID
%token <sval> STRING
%token <sval> CHAR
%token <sval> COND_OP
%token <ival> NUMBER
%token <boolval> BOOL_VAL
%token <sval> ASSIGN_OP
%token <sval> PLUS
%token <sval> MULTIPLY
%token <sval> DIVIDE
%token <sval> MODULO
%token <sval> EQUALEQUAL
%token <sval> NOTEQUAL
%token <sval> GREATEREQUAL
%token <sval> LESSEQUAL
%token <sval> GREATERTHAN
%token <sval> LESSTHAN
%token AND OR BREAK RETURN CONTINUE

%left OR
%left AND
%token EQUALTO PLUSEQUAL MINUSEQUAL SEMICOLON
%left EQUALEQUAL NOTEQUAL
%nonassoc LESSEQUAL LESSTHAN GREATEREQUAL GREATERTHAN
%left NOT PLUS MINUS MULTIPLY DIVIDE MODULO

%%
Program:
	CLASS PROGRAM OPEN field_decl_list  methods CLOSE { f << "Program Encountered" << endl;}
;
field_decl_list:
	
	|  field_decl_list field_decl SEMICOLON
;
field_decl:
	type vars
;
vars:
	var COMMA vars |
	var
;
var:
	ID {f << "ID="<< $1 << endl;} | ID OPEN_SQR NUMBER CLOSE_SQR {f << "ID=" << $1 << endl << "SIZE=" << $3 << endl;}
;
methods:
	 method_decl methods | 
;
method_decl:
	type ID OPEN_PAREN args CLOSE_PAREN block |
	VOID ID OPEN_PAREN args CLOSE_PAREN block
;
args:
	args COMMA type ID | type ID
;
block:
	OPEN non_4 non_5 CLOSE
;
var_decl:
	type non_3 SEMICOLON
;
non_3:
	non_3 COMMA ID {f << "ID = " << $3 << endl;}| ID {f << "ID = "<< $1 <<endl;}
;
non_4:
	non_4 var_decl |

;
non_5:
	non_5 statement |
;
statement:
	location EQUALTO expr SEMICOLON|
	location PLUSEQUAL expr SEMICOLON|
	location MINUSEQUAL expr SEMICOLON |
	method_call SEMICOLON |
	IF OPEN_PAREN expr CLOSE_PAREN block ELSE block |
	IF OPEN_PAREN expr CLOSE_PAREN block|
	FOR ID EQUALTO expr COMMA expr block |
	RETURN expr SEMICOLON |
	RETURN SEMICOLON |
	BREAK SEMICOLON |
	CONTINUE SEMICOLON|
	block
; 
expr:
	location|
	method_call|
	literal |
	NOT expr |
	expr PLUS expr {f << "PLUS encountered\n";} |
	expr MINUS expr {f << "MINUS encountered\n";}|
	expr MULTIPLY expr {f << "MULTIPLY encountered\n";}|
	expr DIVIDE expr {f << "DIVIDE encountered\n";}|
	expr MODULO expr {f << "MODULO encountered\n";}|
	expr GREATERTHAN expr {f << "GREATERTHAN encountered\n";}|
	expr GREATEREQUAL expr {f << "LESSTHAN encountered\n";}|
	expr LESSTHAN expr |
	expr LESSEQUAL expr |
	expr EQUALEQUAL expr |
	expr NOTEQUAL expr |
	expr AND expr |
	expr OR expr|
	OPEN_PAREN expr CLOSE_PAREN
;
method_call:
	method_name OPEN_PAREN non_1 CLOSE_PAREN | method_name OPEN_PAREN CLOSE_PAREN|
	CALLOUT OPEN_PAREN STRING non_2 CLOSE_PAREN |
	CALLOUT OPEN_PAREN STRING CLOSE_PAREN
;
non_2:
	callout_arg COMMA non_2 | callout_arg
;
callout_arg:
	expr
;
non_1:
	expr COMMA non_1 | expr
;
method_name:
	ID
;
location:
	ID |
	ID OPEN_SQR expr CLOSE_SQR
;
literal:
	NUMBER {f << "NUMBER encountered= " << $1 <<endl;}| CHAR {f << "CHAR encountered= " << $1<<endl;}| STRING {f << "STRING encountered= " << $1<<endl;} | BOOL_VAL {f << "BOOLEAN value encounterd encountered= " << $1 << endl;}
;
type:
	INT {f<< "INT var" << endl;} | BOOL {f <<  "BOOL var" << endl;}
;
%%
int main(int argc, char** argv) {
	// open a file handle to a particular file:
	f.open("Bison_output.txt");
	FILE *myfile = fopen(argv[1], "r");
	// make sure it is valid:
	if (argc==2) {
		yyin  = myfile;
	}
	else
	{
		yyin = stdin;
	}
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));

}

void yyerror(const char *s) {
	f << "Syntax Error\n" << s << endl;
	// might as well halt now:
	exit(-1);
}