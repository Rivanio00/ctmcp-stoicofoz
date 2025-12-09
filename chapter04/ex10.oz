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

/* 
Após chamar a função {Three} três vezes temos que, a definição de função lazy, 
a operação só executa quando o seu resultado for necessário, 
ou seja, quando temos o operador “+”, que pede o valor de {Three}, 
sempre que o operador força a avaliação de {Three} pela primeira vez ele executa o {Delay 1000} e retorna 3
Para evitar que esse Delay seja executado 3 vezes basta salvar o valor em uma variável
ex:
R = {Three}
{Show R+0} %  Ao executar R+0, a função executa e atribui valor 3 ao R
{Show R+0} % A partir daqui R=3, não precisamos chamar a função lazy novamente.
{Show R+0}
*/