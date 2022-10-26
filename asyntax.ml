exception Error of string

type exp = Int of int | Float of float | Par of exp | Moins of exp | Plus of exp | IN of exp | FLO of exp | Plusi of exp*exp 
| Multi of exp*exp | Moinsi of exp*exp | Divi of exp * exp| Mod of exp*exp | Plusf of exp*exp | Multf of exp*exp | Moinsf of exp*exp ;;

(*let bien_typée expr = 
  let rec aux = function 
    | Int x -> (true, 1)
    | Float x -> (true, 0)
    | IN x -> let (a,b) = aux x in 





let bien_typee ast =
  let rec aux = function
  (* La deuxieme composante vaut 1 si l'ast a un type entier et 0 si il a le type flottant *)
    | Atom (Int _) -> (true, 1)
    | Atom (Float _) -> (true, 0)
    | Toint s1 ->
        let a, b = aux s1 in
        (a && b = 0, 1)
    | Tofloat s1 ->
        let a, b = aux s1 in
        (a && b = 1, 0)
    | Cons (Plus, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 1, b1)
    | Cons (Plusf, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 0, b1)
    | Cons (Prod, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 1, b1)
    | Cons (Prodf, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 0, b1)
    | Cons (Moins, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 1, b1)
    | Cons (Moinsf, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 0, b1)
    | Cons (Mod, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 1, b1)
    | Cons (Div, s1, s2) ->
        let a1, b1 = aux s1 in
        let a2, b2 = aux s2 in
        ((a1 && a2) && b1 = b2 && b1 = 1, b1)
  in
  let a, b = aux ast in
  a*)