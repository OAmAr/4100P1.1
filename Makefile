CC=gcc

all: latex

latex: latex.l
	lex latex.l
	$(CC) lex.yy.c -o latex
	rm lex.yy.c
clean:
	rm -rf lex.yy.c latex
