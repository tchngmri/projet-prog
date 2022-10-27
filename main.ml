
open Asyntax
open Lexer
open Parser
open Format
open X86_64


let rec calcul expr = match expr with 
  | Int x -> movq (imm x) (reg rdi) 
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
  | Divi (x,y) -> calcul x ++ (*à diviser dans rax, en argument de la division ce par quoi tu veux diviser, quotient est dans rax, reste dans rdx*)
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
  | IN x -> calcul x


let principale expr = 
  let code = 
    { text = globl "main" ++ label "main" ++ calcul expr ++ 
    call "print_int" ++ ret ++
    inline "
      print_int: 
          movq    %rdi, %rsi
          movq    $S_int, %rdi
          xorq    %rax, %rax
          call printf
          ret
            ";
          data = 
              label "S_int" ++ string "%d\n";} in 
      let c = open_out "resultat.s" in (*crée un fichier*)
      let fmt = formatter_of_out_channel c in (*tu cherches pas*)
      X86_64.print_program fmt code; (*ecrit code dans fichier*)
      close_out c (*ferme le fichier*)

let _ =
  let argument = Lexing.from_channel (open_in Sys.argv.(1)) in (* Mettre stdin pour lire directement le texte ecrit dans la console *)
  let expr = Parser.parse Lexer.token argument in
  if not (Asyntax.bien_typee expr) then (failwith "Erreur de typage") else
  principale expr