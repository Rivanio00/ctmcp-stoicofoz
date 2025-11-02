declare
fun {Append Xs Ys}
   fun {ReverseAppendIter Xs Ys}
      case Xs
      of nil then Ys % Se chegar ao fim do vetor Xs recebe o vetor Ys
      [] X|Xr then {ReverseAppendIter Xr X|Ys} end % Senão coloca a cabeça de Xs(lol) X que recebe Ys como rabo
   end
   fun {Reverse Xs}
      fun {ReverseIter Xs A}
	 case Xs
	 of nil then A
	 [] X|Xr then {ReverseIter Xr X|A} end
      end
   in
      {ReverseIter Xs nil}
   end
in
   {ReverseAppendIter {Reverse Xs} Ys} % Inverte a lista Xs e passa para ReverseAppendIter
end

{Browse {Append [1 2 3] [4 5 6]}}
/*Exemplo rodando
    [1 2 3] [4 5 6]
    [3 2 1] [4 5 6]  REVERSE
    
    Primeira iteração:
        Xs = [3 2 1]
        Ys = [4 5 6]
        Xs não é vazio
        X|Xr -> X = [3] / Xr = [2 1]
        {ReverseAppendIter [2 1] [3]|[4 5 6]}
        
    Segunda iteração:
        Xs = [2 1]
        Ys = [3 4 5 6]
        Xs não é vazio
        X|Xr -> X = [2] / Xr = [1]
        {ReverseAppendIter [1] [2]|[ 3 4 5 6]}

    Terceira iteração:
        Xs = [1]
        Ys = [2 3 4 5 6]
        Xs não é vazio
        X|Xr -> X = [1] / Xr = []
        {ReverseAppendIter [] [1]|[2 3 4 5 6]}

    Quarta iteração:
        Xs = []
        Ys = [1 2 3 4 5 6]
        Xs é vazio
        RETORNA Ys
 */