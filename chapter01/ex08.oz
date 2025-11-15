declare
A = {NewCell 0} % Devemos criar uma Célula fora da função

declare
fun {Accumulate A N}
    A:=@A+N
    @A
end

{Browse {Accumulate A 5}}
{Browse {Accumulate A 100}}
{Browse {Accumulate A 45}}