declare
A = 2       % 2^1
B = A*A     % 2^2
C = B*B     % 2^4
D = C*C     % 2^8
E = D*D     % 2^16
F = E*E     % 2^32
G = F*F     % 2^64
H = G*F     % 2^96
I = H*C     % 2^100

{Browse I}

/*
Utilizamos a propriedade da soma dos expoentes pra minimizar as operações, poderíamos
também dizer que A = 1 = 2^0, pra ser a constante inicial. Teríamos B = A * 2 ...

b) Para 100! o método direto é multiplicar os inteiros de 1 a 100 (iterativo ou recursivo). 
    Não existe uma “fórmula fechada” que dê o inteiro exato mais curta que esse método
*/