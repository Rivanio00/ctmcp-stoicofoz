declare
fun {Convolute Xs Ys}
   proc {ConvoluteIter Xs Ys ?Zs}
      case Xs
      of nil then Zs = nil
      [] X|Xr then
	 case Ys of Y|Yr then Rs in
	    Zs = X#Y|Rs
	    {ConvoluteIter Xr Yr Rs}
	 end
      end
   end
in
   {ConvoluteIter Xs {Reverse Ys}}
end
{Browse {Convolute [2 4 6] [1 3 5]}}

/*
Explicando->
{Convolute [2 4 6] [1 3 5]}
Xs = [2 4 6]; Ys = [1 3 5]
{ConvoluteIter Xs {Reverse Ys}}
{ConvoluteIter [2 4 6] [5 3 1]}

    Primeira Iteração
    Xs = [2 4 6]
    Ys = [5 3 1]
    Xs não é nulo então segue
    X|Xr = 2 | 4 6
    Y|Yr = 5 | 3 1
    Zs = 2#5 | Rs          % cria o primeiro par e diz que o resto da lista é Rs (variável lógica)
    {ConvoluteIter Xr Yr Rs} % chama recursivamente passando Rs pra ligar o resto da lista

    Segunda Iteração
    Xs = [4 6]
    Ys = [3 1]
    Xs não é nulo então segue
    X|Xr = 4 | 6
    Y|Yr = 3 | 1
    Rs = 4#3 | Rs2        % o Rs da primeira chama agora vira lista com o par 4#3, o resto é Rs2
    {ConvoluteIter Xr Yr Rs2}

    Terceira Iteração
    Xs = [6]
    Ys = [1]
    Xs não é nulo então segue
    X|Xr = 6 | nil
    Y|Yr = 1 | nil
    Rs2 = 6#1 | Rs3       % Rs2 vira lista com o par 6#1, e resto Rs3
    {ConvoluteIter Xr Yr Rs3}

    Quarta Iteração
    Xs = nil
    Ys = nil
    Xs é nulo -> Rs3 = nil % quando lista acaba, fecha a lista ligando Rs3 a nil
    retorna Zs               % agora Zs é a lista totalmente construída
fim
*/