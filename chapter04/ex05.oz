declare
proc {Wait X}
   if X==unit then skip else skip end
end
/*
A função {Wait X} é uma forma eficiente de forçar que uma thread em execução esperar que a variável X seja ligada,
a operação == unit não pode ser avaliada se o X estiver unbound, 
se uma operação tenta acessar uma variável não ligada a thread é suspensa e espera até que X seja associado a algum valor,
ou seja, a thread só é reativada quando X é ligado.  
*/

% Exemplo
local X T0 T1 in
   T0 = {Time.time}

   % Thread que ligará 'X' após um Delay
   thread
      {Delay 3000}
      X = true
   end
   {Browse '--> Thread principal suspensa. Esperando por X...'}
   
   % chama a operação Wait: a thread principal suspende aqui.
   {Wait X}
   
   T1 = {Time.time}  % Tempo final

   {Browse '--> X foi ligado! Thread principal retomada.'}
   {Browse 'Valor de X: '#X}
   {Browse 'Tempo de espera'#(T1 - T0)}
end