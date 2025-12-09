local A B C D in
   %% Versão concorrente
   thread D=C+1 end
   thread C=B+1 end
   thread A=1 end
   thread B=A+1 end
   {Browse 'Concorrente: '#D}
end

local A B C D in
   %% Versão sequencial
   A=1
   B=A+1
   C=B+1
   D=C+1
   {Browse 'Sequencial: '#D}
end

/*
No exemplo sequencial como existe apenas uma linha de execução, as instruções são executadas na ordem em que aparecem
A=1, B=1+1 -> B=2, C=2+1 -> C=3, D=3+1 -> D=4
{Browse D} printa 4
Logo, o resultado de ambos os programas é exatamente o mesmo (4), 
mesmo que o primeiro tenha criado threads em uma ordem arbitrária e o segundo tenha executado sequencialmente,
pois as threads ficam suspensas esperando o valor das variáveis, o que mantém uma ordem de execução.

Independente da ordem o resultado é igual, 
se existe uma execução sequencial correta a concorrente também seguirá, 
o que é definido do modelo declarativo.
*/