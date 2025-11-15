fun {SumList L}
    case L of X|L1 then X+{SumList L1}
    else 0 
    end
end

/*
A função SumList soma todos elementos de uma lista, abrindo uma árvore da recursão e a
soma “ocorre” do fim do vetor para o início, no entanto a lista {Ints 0} é uma lista infinita, [0,
1, 2, 3, ...], logo o algoritmo só terminaria quando chegar ao fim do vetor, no entanto, o vetor
é infinito, logo não teríamos resultado ou receberíamos uma mensagem de erro do tipo
timeout. Definitivamente não é uma boa ideia.
*/

declare Ints
fun lazy {Ints N}
   N|{Ints N+1}
end