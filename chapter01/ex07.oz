local X in
    X=23
    local X in
        X=44
    end
    {Browse X}
end

% No código acima mostraremos 23, pois quando definimos
    local X in
        X = 44
    end
% Temos que quando o código acessa a linha {Browse X} a variável X já não tem mais o valor
% 44, pois já saiu desse bloco do código.

local X in
    X={NewCell 23}
    X:=44
    {Browse @X}
end

% No código acima mostraremos 44, pois quando definimos a Célula X
    X={NewCell 23}
    X:=44
% Temos que, definimos X = 23 mas atualizamos logo em seguida para X := 44