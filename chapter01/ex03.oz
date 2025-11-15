/*
Prova ShiftLeft:
    Recebe uma lista L;
    Se a lista está vazia retorna uma lista [0];
    Supondo que ShiftLeft da Lista T == L-[H(primeiro elemento)] seja correto;
    Temos que ShiftLeft de L é correto pois:
    ShiftLeft de L == H + ShiftLeft de T;
    Pela hipótese que o ShiftLeft de T é correto pode-se afirmar que:
        ShiftLeft de L é correto.

Prova ShiftRight:
    Recebe uma lista L;
    Supondo que a Lista L está correta;
        Se L = nil, então ShiftRight(nil) = 0 | nil = [0]. Correto.
        Se L = H|T, então ShiftRight(L) = 0 | (H|T) = [0 H T], que significa inserir 0 no início da lista.
    {H + T} == {[0] + L} está correto;
    Logo pode-se afirmar que:
        ShiftRight está correto.

Prova AddList:
    Recebe duas listas, L1 e L2 de mesmo tamanho;
    Se as listas estiverem vazias, retorna vazio "nil";
    L1 = {H1 + T1} e L2 = {H2 + T2}
    Supondo que o {AddList T1 T2} é correto;
    Temos que {AddList L1 L2} == {[H1+H2] + {AddList T1 T2}}
    Logo pode-se afirmar que:
        Addlist está correto;

Prova Pascal:
    Para naturais, ou seja 1,2,3...
    Temos que Pascal de 1 == [1] (O programa retorna esse caso);
    Supondo que o Pascal de N-1 é correto;
    Sabendo que ShiftLeft, ShiftRight e AddList são corretos
    Temos que Pascal de N -> C(n, k) = C(n-1, k-1) + C(n-1, k)
    {AddList {ShiftLeft {Pascal N-1}} {ShiftRight {Pascal N-1}}}
    Pela hipótese que Pascal de N-1 é correto então pode-se afirmar que:
        Pascal de N é correto.
*/