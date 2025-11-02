declare
fun {Fact N}
   fun {FactIter N Acc}
      if N==1 then Acc
      else {FactIter N-1 N*Acc} end % Acc é o acumulador, passando o valor pra chamada seguinte
   end
in
   {FactIter N 1} % Primeiro passo após chamar {Fact N}
end

{Browse {Fact 5}}

/*  Exemplo rodando:
{Fact 5} -> {FactIter 5 1}
            {FactIter 5 1} -> {FactIter 4 5}
                              {FactIter 4 5} -> {FactIter 3 20}
                                                {FactIter 3 20} -> {FactIter 2 60}
                                                                   {FactIter 2 60} -> {FactIter 1 120} 
                                                                                      {FactIter 1 120} -> 120                                                                                    
*/