declare
fun lazy {Three} {Delay 1000} 3 end

{Browse {Three}+0}
{Browse {Three}+0}
{Browse {Three}+0}

local R in
   R = {Three} % A chamada preguiçosa é feita APENAS uma vez.
   
   %% A avaliação só ocorre na primeira vez que R é necessário.
   {Browse R + 0}  % Espera 1000 ms e usa o valor de R.
   
   %% Não há espera, R já está ligado ao valor 3.
   {Browse R + 0}  % Resultado é instantâneo (reutiliza o valor).
   
   {Browse R + 0}  % Resultado é instantâneo.
end