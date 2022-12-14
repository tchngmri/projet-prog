all : asyntax.cmo lexer.cmo parser.cmo main.cmo
	ocamlc x86_64.cmo asyntax.cmo lexer.cmo parser.cmo main.cmo -o aritha && pdflatex rapport.tex

main.cmo :
	ocamlc -c main.ml

asyntax.cmo :
	ocamlc -c asyntax.ml

parser.cmo : parser.cmi
	ocamlc -c parser.ml

lexer.cmo : lexer.ml parser.cmi
	ocamlc -c lexer.ml

parser.cmi : parser.mli asyntax.cmo
	ocamlc -c parser.mli

parser.mli :
	ocamlyacc parser.mly

lexer.ml :
	ocamllex lexer.mll

clean :
	rm -f asyntax.cmi asyntax.cmo lexer.cmo lexer.cmi lexer.ml parser.cmi parser.cmo parser.ml parser.mli aritha main.cmi main.cmo