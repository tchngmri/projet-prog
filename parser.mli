type token =
  | LPAREN
  | RPAREN
  | EOL
  | INT of (int)
  | FLOAT of (float)
  | TOINT
  | TOFLOAT
  | PLUS
  | PLUSF
  | MINUS
  | MINUSF
  | TIMES
  | TIMESF
  | DIV
  | MOD

val parse :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Asyntax.exp
