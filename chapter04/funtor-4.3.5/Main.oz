declare
%% PORTAS LÓGICAS

%% NOT
fun {NotG Xs}
   Ys
in
   local
      fun {NotLoop Xs}
         case Xs
         of X|Xr then
            (1-X) | {NotLoop Xr}
         else
            nil
         end
      end
   in
      thread
         Ys = {NotLoop Xs}
      end
   end
   Ys
end

%% GERADOR DE PORTAS BINÁRIAS
fun {GateMaker F}
   fun {$ Xs Ys}
      Zs
   in
      local
         fun {BinLoop Xs Ys}
            case Xs#Ys
            of (X|Xr)#(Y|Yr) then
               {F X Y} | {BinLoop Xr Yr}
            else
               nil
            end
         end
      in
         thread
            Zs = {BinLoop Xs Ys}
         end
      end
      Zs
   end
end

AndG  = {GateMaker fun {$ X Y} X*Y end}
OrG   = {GateMaker fun {$ X Y} X+Y-X*Y end}
XorG  = {GateMaker fun {$ X Y} X+Y-2*X*Y end}
NandG = {GateMaker fun {$ X Y} 1-X*Y end}
NorG  = {GateMaker fun {$ X Y} 1-X-Y+X*Y end}

%% CIRCUITOS

%% HALF ADDER
proc {HalfAdder A B ?S ?C}
   thread
      S = {XorG A B}
      C = {AndG A B}
   end
end

%% MUX 2→1
proc {Mux2to1 A B Sel ?Out}
   thread
      NS T1 T2
   in
      NS  = {NotG Sel}
      T1  = {AndG A NS}
      T2  = {AndG B Sel}
      Out = {OrG T1 T2}
   end
end

%% COMPARADOR 1 BIT
proc {Comparator1 A B ?EQ}
   thread
      X
   in
      X  = {XorG A B}
      EQ = {NotG X}
   end
end

%Main

A = 0|1|0|1|_
B = 0|0|1|1|_
S = 0|1|0|1|_

HS HC
MOut
EQ

{HalfAdder A B HS HC}
{Mux2to1 A B S MOut}
{Comparator1 A B EQ}

{Browse 'Entrada A'}           {Browse A}
{Browse 'Entrada B'}           {Browse B}
{Browse 'HalfAdder - Soma'}    {Browse HS}
{Browse 'HalfAdder - Carry'}   {Browse HC}
{Browse 'Mux Output'}          {Browse MOut}
{Browse 'Comparator EQ'}       {Browse EQ}

{Wait HS}