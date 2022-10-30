exception Error of string

(* type exp est le type défini dans le sujet : *)
type exp = Int of int | Float of float | Par of exp | Moins of exp | Plus of exp | IN of exp | FLO of exp | Plusi of exp*exp 
| Multi of exp*exp | Moinsi of exp*exp | Divi of exp * exp| Mod of exp*exp | Plusf of exp*exp | Multf of exp*exp | Moinsf of exp*exp ;;

let bien_typee expr =
(* vérifie qu'une expression exp est bien typée (par exemple, pas d'addition d'un flottant et d'un entier) *)
  let rec aux = function
    | Int _ -> (true,1)
    | Float _ -> (true, 0)
    | Par x -> aux x
    | Moins x -> aux x 
    | Plus x -> aux x
    | IN x -> let a,b = aux x in (a,1)
    | FLO x -> let a,b = aux x in (a,0)
    | Plusi (x,y) | Moinsi(x,y) | Multi (x,y) | Divi (x,y) | Mod(x,y) -> let a,b = aux x and c,d = aux y in (a&&c&&(b==1)&&(d==1), 1)
    | Plusf (x,y) | Multf (x,y) | Moinsf(x,y) -> let a,b = aux x and c,d = aux y in (a&&c&&(b==0)&&(d==0), 0)
in let a,b = aux expr in a

let rec type_resultat = function
(* fonction qui renvoie 1 si le résultat est un entier, 0 si c'est un flottant *)
  | Int _ | IN _ | Plusi (_,_) | Moinsi(_,_) | Multi (_,_) | Divi (_,_) | Mod(_,_) -> 1
  | Par x | Moins x | Plus x -> type_resultat x
  | FLO _ | Float _| Plusf (_,_) | Multf (_,_) | Moinsf(_,_) -> 0