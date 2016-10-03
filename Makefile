parser.tab.c parser.tab.h: parser.y
	bison -v -d parser.y --report=state

lex.yy.c: syntax.l parser.tab.h
	flex syntax.l

sample: lex.yy.c parser.tab.c parser.tab.h
	g++ parser.tab.c lex.yy.c -lfl -o sample
clean:
	rm parser.tab.c parser.tab.h sample