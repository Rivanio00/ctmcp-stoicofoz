declare
fun lazy {MakeX} {Browse x} {Delay 3000} 1 end
fun lazy {MakeY} {Browse y} {Delay 6000} 2 end
fun lazy {MakeZ} {Browse z} {Delay 9000} 3 end
X={MakeX} 
Y={MakeY} 
Z={MakeZ} 
{Browse (X+Y)+Z} 
    
/* 
Na prática, ao executar o programa no ambiente Mozart, 
todas as formas apresentam comportamento sequencial e o tempo total é aproximadamente a soma dos atrasos. 
Isso ocorre porque a avaliação lazy não cria paralelismo automaticamente e a execução acontece em uma única thread. 
O comportamento concorrente descrito no livro é um modelo teórico que depende de múltiplas threads efetivamente ativas.
Para obter o resultado o mais rápido possível, 
não devemos somar os números de forma sequencial. 
A melhor estratégia é usar uma redução em árvores (tree reduction), explorando paralelismo.
*/