declare
fun {QuickSort Ls}
   fun {QuickSortIter Ls E}
      case Ls
      of nil then E
      [] L|Lr then Ys Zs in
      % (a) Escolhe o primeiro elemento L como pivô
      % (b) Particiona Lr em Ys e Zs, onde Ys contém elementos menores que L e Zs os maiores ou iguais
      {Devide Lr L Ys Zs}
      % (c) Ordena recursivamente Ys e Zs, concatenando o resultado com o pivô L entre eles
      % (d) Une as listas S1 e S2 para obter a resposta.
      {QuickSortIter Ys L|{QuickSortIter Zs E}}
      end
   end

   proc {Devide Ls P ?Ys ?Zs}
      case Ls
      of nil then 
         Ys=nil Zs=nil
      [] L|Lr then
	 if L < P then 
            Ys = L|{Devide Lr P $ Zs}
	 else 
            Zs = L|{Devide Lr P Ys $} 
         end
      end
   end
in
   {QuickSortIter Ls nil}
end
    
{Browse {QuickSort [3 2 1 4 5 6 0 1]}}