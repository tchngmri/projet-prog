type exp = Int of int | Float of float | Par of exp | Moins of exp | Plus of exp | IN of exp | FLO of exp | Plusi of exp*exp 
| Multi of exp*exp | Moinsi of exp*exp | Divi of exp * exp| Mod of exp*exp | Plusf of exp*exp | Multf of exp*exp | Moinsf of exp*exp ;;

type lexeme = INT of int | FLOAT of float | ParG | ParD | PLUS | MOINS | DIV | FOIS | MOD | PLUSF | MOINSF | FOISF ;;

(* 1. analyseur lexical *)
let rec supprvide = function (* string list -> string list : supprime les " " *)
  | [] -> []
  | x::q when x = " " -> supprvide q
  | x::q -> x::(supprvide q);;

let rev s =
  let rec aux i =
     if i >= String.length s then "" 
     else (aux (i+1))^(String.make 1 s.[i]) in
  aux 0;;

let point x = (*verifier que pas flottant *)
  let n = String.length x in 
  let bool = ref false in 
  for i= 0 to (n-1) do 
    if(x.[i]='.') then bool:= true done;
  !bool;; 

let rec tolexeme = function 
  | [] -> []
  | x::q when x = "+" -> PLUS::(tolexeme q)
  | x::q when x = "-" -> MOINS::(tolexeme q)
  | x::q when x = "*" -> FOIS::(tolexeme q)
  | x::q when x = "%" -> MOD::(tolexeme q)
  | x::q when x = "(" -> ParG::(tolexeme q)
  | x::q when x = ")" -> ParD::(tolexeme q)
  | x::q when x = "/" -> DIV::(tolexeme q)
  | x::y::q when x = "+" && y = "." -> PLUSF::(tolexeme q)
  | x::y::q when x = "-" && y = "." -> MOINSF::(tolexeme q)
  | x::y::q when x = "*" && y = "." -> FOISF::(tolexeme q)
  | x::q when point x -> (FLOAT(float_of_string x))::(tolexeme q)
  | x::q -> (INT(int_of_string x))::(tolexeme q);;


let lexical chaine = (* string -> string list : renvoie la chaine séparée liste des strings de longueur 1*)
  let l = ref [] in 
  let n = String.length chaine in 
  let i = ref (n-1) in
  while (!i>=0) do 
    if not((int_of_char chaine.[!i] >= 48 && int_of_char chaine.[!i] <=57)) then begin
      if (chaine.[!i] = '.') then (let x::q = !l in l:= (String.cat x (String.make 1 chaine.[!i]))::q)
      else (l:= (String.make 1 chaine.[!i])::!l;
      decr i) end
    else 
      begin
      let j = ref (!i -1) in
      let x = ref (String.make 1 chaine.[!i]) in 
      while ( (!j>=0) && ( (int_of_char chaine.[!j]>=48 && int_of_char chaine.[!j] <=57) || chaine.[!j] = '.' ) ) do
        x:= String.cat !x (String.make 1 chaine.[!j]); 
        decr j done;
      i:= !j;
      x:= rev !x;
      l:= (!x)::(!l);
      end
    done; 
  l:= (supprvide !l);
  (tolexeme !l);;

let test = lexical ("2 + 31 ");;
test;;

(* attention aux opérations avec point !!!!!!*)


(* 2. analyseur syntaxique *)
(* string list -> expr *)

(* gestion de parenthèse --> s'arreter à la bonne parenthèse !!! extraire bon bloc d'instruction *)

(*gestion par : renvoie couple de formule : interieur parenthese et la suite *)




(* ordre de priorité : +/- puis * div mod *)
