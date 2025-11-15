declare
V = [fun {$ X Y} X+Y end
fun {$ X Y} X-Y end
fun {$ X Y} X*Y end
fun {$ X Y} (X+1)*(Y+1) end]


for I in V do
    for J in 1..10 do
        {Browse {GenericPascal I J}}
    end
end

%O resultado da linha 10 no caso (X+1)*(Y+1):