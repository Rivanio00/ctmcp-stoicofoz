declare
fun {Fact N}
    if N==0 then 1 else N*{Fact N-1}end
end

declare
fun {INFact N K}
    if N==K then 1 else N*{INFact N-1 K}end
end

declare
fun {Comb N K}
    {INFact N K} div {Fact N-K}
end

{Browse {Comb 3 2}}
{Browse {Comb 5 2}}
{Browse {Comb 10 3}}

/*
A função INFact é usada para calcular a multiplicação de (n * n-1 * ... n-k+1) isso minimiza
os cálculos usando a propriedade:
{Comb N K} == ( {INFact N K} / {Fact K} ) == ( (n * n-1 * ... n-k+1) / K! )
*/

declare
fun {Comb2 N K}
    if K > (N div 2)then
        {INFact N N-K} div {Fact K}
    else
        {INFact N K} div {Fact N-K}
    end
end

{Browse {Comb2 3 2}}
{Browse {Comb2 5 2}}
{Browse {Comb2 10 3}}   

/*
Essa versão da função Comb usa a propriedade que
SE (K > (N/2)), ENTÃO {Comb N K} == {Comb N N-K}
Logo, se (K>(N/2)), então {Comb N K} == {INFact N N-K} / {Fact K}
*/