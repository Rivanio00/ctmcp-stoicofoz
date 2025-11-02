declare
fun {BscMeth F A B}
   fun {BscMethIter A B}
      X = (A+B)/2.0
      V = {F X}
   in
      if {GoodEnough V} then X
      else A1 B1 in
	 A1#B1={Improve A B V X}
	 {BscMethIter A1 B1}
      end
   end
   fun {GoodEnough V} 
      {Abs V} < 0.00001 % se f(v) < erro chegamos ao resultado
   end
   fun {Improve A B V X}
      if V > 0.0 then A#X % f(a) < 0.0 e f(v) > 0.0
      else X#B end        % f(b) > 0.0 e f(v) < 0.0
   end
in
   if {F A} < {F B} then {BscMethIter A B} % mantém a ordem f(a) < f(b) (tratamento para intervalos que f(k) decresce)
   else {BscMethIter B A} % caso contrário só troca a ordem dos argumentos
   end
end

{Browse {BscMeth fun{$ X} X*X - 2.0 end 0.0 2.0}}
{Browse {BscMeth fun{$ X} (2.0 - (X*X)) end 0.0 2.0}}