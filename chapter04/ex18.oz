declare
proc {TryFinally S1 S2} 
   B Y in 
   try {S1} B=false
   catch X then B=true Y=X end 
   {S2} 
   if B then raise Y end end 
end 

local U=1 V=2 in 
   {TryFinally 
      proc {$} 
         thread 
            {TryFinally 
               proc {$} U=V end
               proc {$} {Browse bing} end} 
         end 
      end 
      proc {$} {Browse bong} end} 
end

/* 
Uma thread é criada e executa TryFinally, 
onde U=V falha, a execução é  capturada, 
{Browse bing} é executado no finaly e a exceção é então relançada, encerrando essa thread.
A thread principal, após criar a thread interna, 
continua imediatamente e executa {Browse bong}.
As duas únicas saídas observáveis são bing e bong, 
a única diferença possível é a ordem em que aparecem, logo, existem 2 resultados possíveis:
bing - bong, ou bong - bing
Mas, analisando a semântica da máquina abstrata, 
o passo {Browse bong} pode ocorrer em cinco posições possíveis dentro da sequência ordenada de ações da thread interna.
Logo, há 5 execuções possíveis, mas somente 2 resultados observáveis.
*/