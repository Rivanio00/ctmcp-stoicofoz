% Em Oz "-" é um operador que espera dois valores, para definir um valor negativo usamos "~"
declare
%X = -5
Y = 0-5
Z = ~5
%{Browse X} % Error
{Browse [Y Z]}

declare
fun {Abs X}
    if X<0 then ~X % X < 0 -> válido apenas para valores inteiros
    else X 
    end 
end

{Browse {Abs 10}}
%{Browse {Abs 10.0}} Error

fun {NewAbs X} 
    if X<0.0 then ~X  % X < 0.0 -> não é válido para inteiros
    else X 
    end 
end

%{Browse {NewAbs 10}} Error
{Browse {NewAbs 10.0}}