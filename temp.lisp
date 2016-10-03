for {return FOR;}
if {return IF;}
else {return ELSE;}
callout {return CALLOUT;}
class {return CLASS;}
"continue" {return CONTINUE;}
int {return INT;}
boolean {return BOOL;}
true|false {yylval.boolval = str_to_bool(yytext);return BOOL_VAL;}

>= | = | > | <= | < {yylval.sval = strdup(yytext);return REL_OP;}
== | != {yylval.sval = strdup(yytext);return EQ_OP;}
"+" | "-" | "*" | "/" {yylval.sval = strdup(yytext);return ARITH_OP;}
{LETTER}{ALPHA}* {yylval.sval = strdup(yytext);return ID;}
-?{DIGIT}+ | -?{DIGIT}x{ALPHA}+ {yylval.ival = text_to_i(yytext);return NUMBER;}
'[ -~]' {yylval.sval = strdup(yytext); return CHAR;}





%token <sval> ID
%token INT
%token <ival> NUMBER
%token <sval> STRING
%token <sval> CHAR
%token <sval> ARITH_OP
%token <sval> EQ_OP
%token <sval> REL_OP
%token <sval> COND_OP
%token <boolval> BOOL_VAL





for {/*return FOR;*/}
if {/*return IF;*/}
else {/*return ELSE;*/}
callout {/*return CALLOUT;*/}
class {/*return CLASS;*/cout << "6" << endl;}
"continue" {/*return CONTINUE;*/cout << "7" << endl;}
int {/*return INT;*/cout << "8" << endl;}
boolean {/*return BOOL;*/cout << "9" << endl;}
true|false {/*yylval.boolval = str_to_bool(yytext);*/cout << "10" << endl;return BOOL_VAL;}
>= | = | > | <= | < {/*yylval.sval = strdup(yytext);*/cout << "11" << endl;return REL_OP;}
== | != {/*yylval.sval = strdup(yytext);*/cout << "12" << endl;return EQ_OP;}
"+" | "-" | "*" | "/" {/*yylval.sval = strdup(yytext);*/cout << "13" << endl;/*return ARITH_OP;*/}
{DELIM} {/*DO nothing*/}
{LETTER}{ALPHA}* {/*yylval.sval = strdup(yytext);*/cout << "14" << endl;/*return ID;*/}
-?{DIGIT}+ | -?{DIGIT}x{ALPHA}+ {/*yylval.ival = text_to_i(yytext);*/cout << "15" << endl;/*return NUMBER;*/}
'[ -~]' {/*yylval.sval = strdup(yytext);*/cout << "16" << endl;/*return CHAR;*/}






unsigned long int text_to_i(char *s)
{
    string strng = s;
    if(strstr(s,"x")!=NULL)
        return strtoul(strng.c_str(),NULL,16);
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

int main( int argc, char **argv )
{
    f= fopen("output.txt","w");
    if(f == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }
    ++argv, --argc;  
    if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;
    yylex();
    if(flag==1)
        printf("Success\n");
    else
        printf("Syntax Error\n");
}


true|false {yylval.boolval = str_to_bool(yytext);return BOOL_VAL;}
">=" | "=" | ">" | "<=" | < {yylval.sval = strdup(yytext);return REL_OP;}
"==" | "!=" {yylval.sval = strdup(yytext);return EQ_OP;}
"+" | "-" | "*" | "/" {yylval.sval = strdup(yytext);return ARITH_OP;}
{LETTER}+ {yylval.sval = strdup(yytext);return ID;}
{DIGIT}+ {yylval.ival = text_to_i(yytext);return NUMBER;}