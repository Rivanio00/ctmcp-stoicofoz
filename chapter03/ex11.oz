/*
L-T(lista - cauda)
temos que L1-T1 L2-T2 de tal forma que
se dissermos que T1 = L2
concatenamos  as listas L1-L2
no entanto se fizermos a seguinte operação
T1 = L2
T2 = L2
Cria-se referências circulares ou modifica a mesma lista em dois lugares.
O resultado é que a lista final fica corrompida: elementos podem se repetir, ou a lista pode entrar em loop infinito ao percorrer.
Ou seja, o perigo é “reusar” a mesma lista por diferença em múltiplos append, porque a operação não copia os elementos, só liga variáveis.
Anexar a uma lista de diferenças significa vincular o final a outra lista. É claro que isso não pode ser feito duas vezes.
 */

 declare
% Criando duas listas
L1 T1 L2 T2

L1 = 1|2|T1
L2 = 3|4|T2

% ligando T1 a L2
T1 = L2
T2 = nil

{Browse 'Lista concatenada corretamente:'}
{Browse L1}


declare
% Criando duas listas
A TA B TB

A = 1|TA
B = 2|TB

TA = B % A = 1|B -> A = 1|2
TB = B % B = 2|B -> B = 2|2 2 2 2...
% Consequentemente A = 1|2 2 2 2 2...


{Browse 'Lista corrompida (referência circular):'}
{Browse A}  % Cuidado: loop infinito se tentar percorrer!
