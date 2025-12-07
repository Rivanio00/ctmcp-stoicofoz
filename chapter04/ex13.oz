declare
fun lazy {Reverse1 S} 
   fun {Rev S R} 
      case S 
      of nil then 
         {Browse 'Reverse1: fim'}
         R 
      [] X|S2 then
         {Browse 'Reverse1: processando '#X}
         {Delay 500}
         {Rev S2 X|R} 
      end 
   end 
in 
   {Rev S nil} 
end 

fun lazy {Reverse2 S} 
   fun lazy {Rev S R} 
      case S 
      of nil then 
         {Browse 'Reverse2: fim'}
         R 
      [] X|S2 then
         {Browse 'Reverse2: processando '#X}
         {Delay 500}
         {Rev S2 X|R} 
      end 
   end 
in 
   {Rev S nil} 
end

proc {ForceList L}
   case L
   of nil then 
      {Browse '--- fim da lista ---'}
   [] H|T then
      {Browse 'elemento: '#H}
      {Delay 1000}
      {ForceList T}
   end
end

declare L1 L2 in

{Browse '--- Criando Reverse1 ---'}
L1 = {Reverse1 [a b c]}

{Browse '--- Criando Reverse2 ---'}
L2 = {Reverse2 [a b c]}

{Browse '--- Forçando Reverse1 passo a passo ---'}
{ForceList L1}

{Browse '--- Forçando Reverse2 passo a passo ---'}
{ForceList L2}

/* 
A fun Reverse 1, apenas a função externa é lazy, 
isso significa que quando o resultado é requisitado toda a lista é invertida, 
já a Reverse2 a função auxiliar Rev também é lazy, 
o que faz com que cada passo da recursão seja adiado, 
a lista é invertida de forma gradual, de acordo com a requisição de seus termos.
As duas produzem a mesma lista final [c b a], mas não possuem o mesmo comportamento lazy. 
Reverse1 é mais eficiente pois evita a criação de diversos trunks desnecessários. 
Em um programa realmente lazy, a melhor escolha seria Reverse1, pois ela mantém a interface preguiçosa com melhor desempenho.
*/