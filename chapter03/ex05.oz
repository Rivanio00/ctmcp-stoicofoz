%Versão original:
declare
fun {SumList Xs}
   case Xs
   of nil then 0
   [] X|Xr then X+{SumList Xr}
   end
end

/*Pode ser escrita como
declare SumList
SumList = proc {$ Xs R}
   case Xs
   of nil then
      R = 0
   [] X|Xr then
      local V in
         {SumList Xr V} 
         R = X + V  % Não é recursiva pela cauda
      end
   end
end
 */

%Atualizada:
fun {SumList2 Xs}
   fun {SumListIter Ys A}
      case Ys
      of nil then A
      [] Y|Yr then {SumListIter Yr A+Y} end
   end
in
   {SumListIter Xs 0}
end

{Browse {SumList [1 2 3 4 5]}}
{Browse {SumList2 [1 2 3 4 5]}}