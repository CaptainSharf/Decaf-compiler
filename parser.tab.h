/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    THIS = 258,
    OPEN = 259,
    CLOSE = 260,
    VOID = 261,
    PROGRAM = 262,
    INT = 263,
    BOOL = 264,
    IF = 265,
    ELSE = 266,
    CLASS = 267,
    CALLOUT = 268,
    FOR = 269,
    OPEN_PAREN = 270,
    CLOSE_PAREN = 271,
    CONT = 272,
    NOT = 273,
    MINUS = 274,
    OPEN_SQR = 275,
    CLOSE_SQR = 276,
    COMMA = 277,
    ARITH_OP = 278,
    EQ_OP = 279,
    REL_OP = 280,
    ID = 281,
    STRING = 282,
    CHAR = 283,
    COND_OP = 284,
    NUMBER = 285,
    BOOL_VAL = 286,
    ASSIGN_OP = 287,
    PLUS = 288,
    MULTIPLY = 289,
    DIVIDE = 290,
    MODULO = 291,
    EQUALEQUAL = 292,
    NOTEQUAL = 293,
    GREATEREQUAL = 294,
    LESSEQUAL = 295,
    GREATERTHAN = 296,
    LESSTHAN = 297,
    AND = 298,
    OR = 299,
    BREAK = 300,
    RETURN = 301,
    CONTINUE = 302,
    EQUALTO = 303,
    PLUSEQUAL = 304,
    MINUSEQUAL = 305,
    SEMICOLON = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 14 "parser.y" /* yacc.c:1909  */

	char *sval;
	int ival;
	bool boolval;

#line 112 "parser.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
