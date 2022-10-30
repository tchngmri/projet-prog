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

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* EOL *);
  262 (* TOINT *);
  263 (* TOFLOAT *);
  264 (* PLUS *);
  265 (* PLUSF *);
  266 (* MINUS *);
  267 (* MINUSF *);
  268 (* TIMES *);
  269 (* TIMESF *);
  270 (* DIV *);
  271 (* MOD *);
    0|]

let yytransl_block = [|
  260 (* INT *);
  261 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\004\000\004\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\004\000\
\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\002\000\003\000\000\000\000\000\000\000\
\000\000\019\000\000\000\000\000\000\000\000\000\000\000\017\000\
\000\000\018\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\006\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\011\000\012\000\013\000\014\000\
\005\000\004\000\016\000\015\000"

let yydgoto = "\002\000\
\010\000\011\000"

let yysindex = "\006\000\
\107\255\000\000\107\255\000\000\000\000\012\255\014\255\004\255\
\005\255\000\000\092\255\023\255\107\255\107\255\107\255\000\000\
\107\255\000\000\000\000\107\255\107\255\107\255\107\255\107\255\
\107\255\107\255\107\255\000\000\037\255\051\255\065\255\079\255\
\245\254\245\254\245\254\245\254\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\116\255\120\255\130\255\134\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\253\255"

let yytablesize = 145
let yytable = "\012\000\
\024\000\025\000\026\000\027\000\015\000\017\000\001\000\016\000\
\018\000\029\000\030\000\031\000\013\000\032\000\014\000\000\000\
\033\000\034\000\035\000\036\000\037\000\038\000\039\000\040\000\
\028\000\000\000\000\000\000\000\000\000\000\000\020\000\021\000\
\022\000\023\000\024\000\025\000\026\000\027\000\041\000\000\000\
\000\000\000\000\000\000\000\000\020\000\021\000\022\000\023\000\
\024\000\025\000\026\000\027\000\042\000\000\000\000\000\000\000\
\000\000\000\000\020\000\021\000\022\000\023\000\024\000\025\000\
\026\000\027\000\043\000\000\000\000\000\000\000\000\000\000\000\
\020\000\021\000\022\000\023\000\024\000\025\000\026\000\027\000\
\044\000\000\000\000\000\000\000\000\000\000\000\020\000\021\000\
\022\000\023\000\024\000\025\000\026\000\027\000\019\000\000\000\
\000\000\000\000\000\000\020\000\021\000\022\000\023\000\024\000\
\025\000\026\000\027\000\003\000\000\000\000\000\004\000\005\000\
\006\000\007\000\008\000\000\000\009\000\007\000\007\000\000\000\
\000\000\008\000\008\000\007\000\007\000\007\000\007\000\008\000\
\008\000\008\000\008\000\009\000\009\000\000\000\000\000\010\000\
\010\000\009\000\009\000\009\000\009\000\010\000\010\000\010\000\
\010\000"

let yycheck = "\003\000\
\012\001\013\001\014\001\015\001\001\001\001\001\001\000\004\001\
\004\001\013\000\014\000\015\000\001\001\017\000\001\001\255\255\
\020\000\021\000\022\000\023\000\024\000\025\000\026\000\027\000\
\002\001\255\255\255\255\255\255\255\255\255\255\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\002\001\255\255\
\255\255\255\255\255\255\255\255\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\002\001\255\255\255\255\255\255\
\255\255\255\255\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\002\001\255\255\255\255\255\255\255\255\255\255\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\002\001\255\255\255\255\255\255\255\255\255\255\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\003\001\255\255\
\255\255\255\255\255\255\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\015\001\001\001\255\255\255\255\004\001\005\001\
\006\001\007\001\008\001\255\255\010\001\002\001\003\001\255\255\
\255\255\002\001\003\001\008\001\009\001\010\001\011\001\008\001\
\009\001\010\001\011\001\002\001\003\001\255\255\255\255\002\001\
\003\001\008\001\009\001\010\001\011\001\008\001\009\001\010\001\
\011\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  EOL\000\
  TOINT\000\
  TOFLOAT\000\
  PLUS\000\
  PLUSF\000\
  MINUS\000\
  MINUSF\000\
  TIMES\000\
  TIMESF\000\
  DIV\000\
  MOD\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 12 "parser.mly"
           ( _1 )
# 153 "parser.ml"
               : Asyntax.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 16 "parser.mly"
      ( Asyntax.Int (_1))
# 160 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 17 "parser.mly"
        ( Asyntax.Float (_1))
# 167 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                             ( Asyntax.FLO (_3) )
# 174 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                           ( Asyntax.IN (_3) )
# 181 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                     ( Asyntax.Par (_2) )
# 188 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                 ( Asyntax.Plusi (_1,_3) )
# 196 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                  ( Asyntax.Plusf (_1,_3) )
# 204 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                  ( Asyntax.Moinsi (_1,_3) )
# 212 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                   ( Asyntax.Moinsf (_1,_3) )
# 220 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                  ( Asyntax.Multi (_1,_3) )
# 228 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                   ( Asyntax.Multf (_1,_3) )
# 236 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                ( Asyntax.Divi (_1,_3) )
# 244 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 28 "parser.mly"
                ( Asyntax.Mod (_1,_3) )
# 252 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 29 "parser.mly"
                           ( Asyntax.Moins (_3) )
# 259 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                          ( Asyntax.Plus (_3) )
# 266 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 31 "parser.mly"
           ( Asyntax.Int (_2) )
# 273 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 32 "parser.mly"
            ( Asyntax.Moins (Asyntax.Int (_2)) )
# 280 "parser.ml"
               : 'expr))
(* Entry parse *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let parse (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Asyntax.exp)
