declare
fun {LReverse S}
    fun lazy {Rev S R}
        case S  
        of nil then R
        [] X|S2 then {Rev S2 X|R} end
    end
in {Rev S nil} end
L={LReverse [a b c]}
{Browse L}

/*
A versão lazy de Append sem variáveis de dataflow é iterativa. 
Isso acontece porque a função realiza uma chamada recursiva que é usada diretamente para construir o resto da lista: A|{LApppend Ar Bs}
Nesse caso, a chamada recursiva não é de cauda (tail recursion), 
mas ainda assim é iterativa, pois como a função é definida como lazy, 
os valores só são calculados quando requisitados, 
de forma que ao analisarmos a pilha constatamos que ela não cresce, como em programas recursivos.
local S in
	S = {LApppend Ar Bs}
	R = A | S
end
S <- Não executa suas operações ainda
A <- Cabeça do vetor
S <- Ao ser requisitada retorna a cabeça As e cauda {LApppend Ar Bs}
Mantendo a pilha com tamanho constante
*/