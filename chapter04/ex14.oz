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
A versão lazy de Append sem variáveis de dataflow não é iterativa. 
Isso acontece porque a função realiza uma chamada recursiva que é usada diretamente para construir o resto da lista: A|{LApppend Ar Bs}
Nesse caso, a chamada recursiva não é de cauda (tail recursion), 
já que ainda é necessário concluir a construção da lista após o retorno da chamada. 
Isso obriga o sistema a manter contexto na pilha para cada chamada, caracterizando um processo recursivo e não iterativo.
*/