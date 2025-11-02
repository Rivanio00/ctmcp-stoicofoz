/*
(a) What happens if you delete an element from an empty queue? 
A operação vai falhar ou travar, pode gerar uma variável não ligada sendo usada, o que causa erro de execução, ou seja, sempre precisa verificar se a fila está vazia antes de deletar.

(b) Why is it wrong to define IsEmpty as follows? 
fun {IsEmpty q(N S E)} S==E end 
O problema é que em Oz a fila FIFO geralmente é implementada com variáveis ligadas dinamicamente, usando listas ou arrays circulares. 
S e E não são números fixos; 
Eles podem ser variáveis que ainda não foram ligadas a nada. 
Fazer S == E compara referências das variáveis, não os valores que estão realmente na fila.
S = E   % S e E são variáveis não ligadas
{IsEmpty q(N S E)}  % retorna true mesmo que a fila vá receber elementos depois
Isso dá resultado errado, porque a fila pode não estar vazia na prática, mas a função retorna true.
*/

declare
fun {NewQueue} X in q(0 X X) end
fun {Insert Q X}
   case Q of q(N S E) then E1 in
      E=X|E1
      q(N+1 S E1)
   end
end
fun {Delete Q}
   case Q of q(N S E) then
      q(N-1 S.2 E)
   end
end
fun {IsEmpty Q} case Q of q(N S E) then N==0 end end
fun {IsEmptyWrong Q}
   case Q of q(N S E) then S == E end
end

% Teste
local
   F1 F2 F3
in
   F1 = {NewQueue}
   {Browse {IsEmpty F1}} % true -> está vazia
   {Browse {IsEmptyWrong F1}} % true -> está vazia
   %F2 = {Delete F1} % código para
/*
Na função Delete, você faz q(N-1 S.2 E). Quando N == 0, ou seja, fila vazia, você tenta acessar S.2, que é o segundo elemento da lista S.
Se S for vazio (nil), não tem S.2 e o programa trava (erro de acesso a variável não ligada ou índice inexistente).
Delete está removendo o primeiro elemento da fila, porque está substituindo a lista S pela cauda da lista (S.2).
L = H|T
T = A|B
remove H de L e em seguida
L = A|B
*/
   F3 = {Insert F1 10}
   {Browse {IsEmpty F3}} % false -> não está vazia
   {Browse {IsEmptyWrong F3}} % código para
/*
A fila está numa situação onde S e E são variáveis não ligadas ou uma referência inválida
A comparação S == E pode tentar acessar algo que não existe internamente
*/
   F4 = {Delete F3}
   {Browse {IsEmpty F4}} % true -> está vazia
   {Browse {IsEmptyWrong F4}}
end