
open Asyntax
open Lexer
open Parser
open Format
open X86_64

let calcul_total expr = 
  let i = ref 0 and l = ref [] in 
  let rec calcul  = function
    | Int x -> movq (imm x) (reg rdi) 
    | Float x -> incr i; l:= (!i,x)::!l; inline ("\tmovsd val"^(string_of_int !i)^", %xmm0\n")
    | Plus x -> calcul x
    | Par x -> calcul x 
    | Moins x -> calcul x ++ negq (reg rdi)
    | Plusi (x,y) -> calcul x ++ 
        pushq (reg rdi) ++ 
        calcul y ++ 
        popq (rsi) ++ 
        addq (reg rsi) (reg rdi)
    | Moinsi(x,y) -> calcul x ++ 
        pushq (reg rdi) ++ 
        calcul y ++ 
        popq (rsi) ++ 
        subq (reg rdi) (reg rsi) ++
        movq (reg rsi) (reg rdi)
    | Multi (x,y) -> calcul x ++ 
        pushq (reg rdi) ++ 
        calcul y ++ 
        popq (rsi) ++ 
        imulq (reg rsi) (reg rdi)
    | Divi (x,y) -> calcul x ++ 
        pushq (reg rdi) ++ 
        calcul y ++ 
        movq (reg rdi) (reg rbx) ++
        popq (rax) ++ 
        xorq (reg rdx) (reg rdx) ++
        idivq (reg rbx) ++ 
        movq (reg rax) (reg rdi)
    | Mod (x,y) -> calcul x ++ 
      pushq (reg rdi) ++ 
      calcul y ++ 
      movq (reg rdi) (reg rbx) ++
      popq (rax) ++ 
      xorq (reg rdx) (reg rdx) ++
      idivq (reg rbx) ++ 
      movq (reg rdx) (reg rdi)
    | IN x -> calcul x ++ if ((type_resultat x)==0) then inline "\t cvtsd2si %xmm0, %rdi\n" else nop
    | FLO x -> calcul x ++ if ((type_resultat x) ==1) then inline "\t cvtsi2sd %rdi, %xmm0\n" else nop
    | Multf (x,y) -> calcul x ++ 
      subq (imm 8) (reg rsp) ++ 
      inline "\tmovsd %xmm0, (%rsp)\n" ++
      calcul y ++
      inline "\tmovsd (%rsp), %xmm1\n" ++
      addq (imm 8) (reg rsp) ++
      mulsd (reg xmm1) (reg xmm0)
    | Plusf (x,y) -> calcul x ++ 
        subq (imm 8) (reg rsp) ++ 
        inline "\tmovsd %xmm0, (%rsp)\n" ++
        calcul y ++
        inline "\tmovsd (%rsp), %xmm1\n" ++
        addq (imm 8) (reg rsp) ++
        addsd (reg xmm1) (reg xmm0)
    | Moinsf (x,y) -> calcul x ++ 
    subq (imm 8) (reg rsp) ++ 
    inline "\tmovsd %xmm0, (%rsp)\n" ++
    calcul y ++
    inline "\tmovsd (%rsp), %xmm1\n" ++
    addq (imm 8) (reg rsp) ++
    subsd (reg xmm1) (reg xmm0) in 
  (!l, calcul expr)

let printi = 
  label "print_int" ++ 
  movq (reg rdi) (reg rsi) ++
  movq (ilab "S_int") (reg rdi) ++ 
  xorq (reg rax) (reg rax) ++
  call "printf" ++
  ret

let printflo = 
  label "print_float" ++ 
  movq (ilab "S_float") (reg rdi) ++
  movq (imm 1) (reg rax) ++
  call "printf" ++
  ret 


let affiche_resultat expr = 
  if (type_resultat expr == 1) then call "print_int" else call "print_float"

let rec valeurflottants = function 
  | [] -> nop
  | (i,x)::y -> label ("val"^(string_of_int i)) ++ double x ++ valeurflottants y
  

let principale expr = 
  let (l,instructions) = calcul_total expr in
  let code = {
    text = globl "main" ++ label "main" ++ 
      instructions ++ 
      affiche_resultat expr ++ 
      ret ++
      printi ++ 
      printflo;
    data = 
      label "S_int" ++ string "Le resultat est %d !\n" ++
      label "S_float" ++ string "Le resultat est %f !\n" ++ valeurflottants l; } in 
  let c = open_out "resultat.s" in (*crée un fichier*)
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code; (*ecrit code dans fichier*)
  close_out c (*ferme le fichier*)


let _ =
  let argument = Lexing.from_channel (open_in Sys.argv.(1)) in 
  let expr = Parser.parse Lexer.token argument in
  if not (Asyntax.bien_typee expr) then (failwith "Erreur de typage") else
  principale expr