declare
fun {Leaf X} 
    case X of _|_ then false % false se for uma lista, pq obviamente é mais simples de entender assim...
    else true % true se não for uma lista
    end 
end

{Browse {Leaf 1}}
{Browse {Leaf [1]}}

fun {NewLeaf X} 
    X\=(_|_) 
end
{Browse {NewLeaf 1}}
{Browse {NewLeaf [1]}} % Ao executar o NewLeaf para [1] o programa para
/*
O operador \= em Oz não é um simples “diferente de” lógico
Ele verifica se dois termos podem ser unificados, unificação é o processo de tentar tornar dois valores estruturalmente iguais
\= é literalmente “não pode ser unificado”  
    Se não podem ser unificados, o resultado é true
    Se podem ser unificados, o resultado é false
    Se um dos lados ainda não está totalmente determinado, a expressão fica suspensa até que haja informação suficiente pra decidir

[1] é unificável com (_|_) (porque [1] = 1|nil → cabeça 1, cauda nil)
Portanto, X \= (_|_) deve dar false, mas o programa suspende
Quando um dos termos contém variáveis livres, Oz espera até ter certeza do resultado
Mas no teu caso, o problema é o uso do padrão (_|_) diretamente dentro da expressão.

Esse padrão contém variáveis anônimas não determinadas (_ e _)
“Talvez esses _ possam ainda se ajustar a alguma forma de X… vou esperar mais informação antes de decidir.” 

Oz é o monge budista das linguagens de programação. Ele não se apressa, não reage, apenas aguarda serenamente que todas as variáveis encontrem seu propósito no universo antes de fazer qualquer coisa.

“May all my threads reach synchronization without suffering.”
*/