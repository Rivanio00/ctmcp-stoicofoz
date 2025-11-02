declare
fun {Append Ls Ms} 
    case Ms 
    of nil then Ls 
    [] X|Mr then {Append {Append Ls [X]} Mr} 
    end
end

/*
Se você prestar atenção na chamada recursiva interna, o segundo argumento nunca será nulo, portanto não terminará. 
Exemplo:
{Append [1 2] [3 4]}

Primeira Iteração: 
    Ls = [1 2]
	Ms = [3 4] é diferente de nil, então chama a recursão
	Ms = 3 | 4, X = [3], Mr = [4]
    {Append {Append [1 2] [3]} [4]}

    Executa  {Append [1 2] [3]}
        Ls = [1 2]
        Ms = [3] é diferente de nil, então chama a recursão
        Ms = 3 | nil, X = [3], Mr = nil
        {Append {Append [1 2] [3]} nil}

            Executa  {Append [1 2] [3]}
                repete o processo
                Executa  {Append [1 2] [3]}
                A cabeça da lista Ms nunca estará vazia.
                Entrou em loop…
 */