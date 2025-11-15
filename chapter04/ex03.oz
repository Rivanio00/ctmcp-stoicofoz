% Sequencial
declare
fun {FibS X}
    if X =< 2 then 
        1
    else 
        {FibS X-1} + {FibS X-2}
    end
end

% Concorrente
fun {FibC X}
    if X =< 2 then
        1
    else
        thread {FibC X-1} end + {FibC X-2}
    end
end

% Computa o tempo de execução
fun {TimeIt F X}
  T0 = {Time.time}
  _ = {F X}
  T1 = {Time.time}
in
  T1 - T0
end

/*
Quantas threads são criadas?
A cada chamda:
FibC(n) = 1 chamada + 1 thread criada + FibC(n-1) + FibC(n-2)
T(n) = Fib(n+2) – 1 -> Número de chamdas / threads
T(30) = (Fib(32) - 1) threads
 */

{Browse {FibS 30}} %resultado
{Browse sequencial#{TimeIt FibS 30}}
{Browse concorrente#{TimeIt FibC 30}}