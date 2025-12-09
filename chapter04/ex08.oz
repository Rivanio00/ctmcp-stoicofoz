declare
fun {Filter In F} 
    case In 
    of X|In2 then 
        if {F X} then 
            X|{Filter In2 F}
        else 
            {Filter In2 F} 
        end 
    else 
        nil 
    end
end

local 
    %% Variáveis globais para os testes
    Out A

    %% --- Caso 1: Sequencial Padrão ---
    {Browse '--- [1] Sequencial Padrão ---'}
    {Show {Filter [5 1 2 4 0] fun {$ X} X>2 end}} 
    {Browse 'Resultado: [5 4] (Processamento imediato e completo).'}
    
    
    %% --- Caso 2: Suspensão em Thread Única ---
    {Browse '--- [2] Suspensão na Thread Principal ---'}
    local A1 in
        {Browse 'Tentando {Show {Filter [5 1 A1 4 0] ...}}'}
        %{Show {Filter [5 1 A1 4 0] fun {$ X} X>2 end}} % Apague essa linha* A1 é unbound, execução fica esperando que seja atribuído valor a ela
        {Browse 'A thread principal suspende na variável A1 e não exibe nada (Deadlock).'}
    end


    %% --- Caso 3: Concorrência com Suspensão Parcial ---
    {Browse '--- [3] Concorrência Parcial ---'}
    Out = _
    A = _
    thread Out={Filter [5 1 A 4 0] fun {$ X} X>2 end} end
    {Show Out}
    {Browse 'Resultado: [5|_] (O Show executa antes da suspensão, exibindo a cabeça ligada e a cauda _ ).'}

    
    %% --- Caso 4: Suspensão com Delay (Tempo Perdido) ---
    {Browse '--- [4] Suspensão com Delay ---'}
    Out = _
    A = _
    thread Out={Filter [5 1 A 4 0] fun {$ X} X>2 end} end
    {Delay 1000} 
    {Show Out}
    {Browse 'Resultado: [5|_] (O Delay não resolve, pois nenhuma thread liga A. O estado não muda.)'}
    

    %% --- Caso 5: Concorrência Completa (Ligação de Dados Garantida) ---
    {Browse '--- [5] Concorrência Completa (Deterministica) ---'}
    Out = _
    A = _
    thread Out={Filter [5 1 A 4 0] fun {$ X} X>2 end} end 
    thread A=6 end 
    {Delay 1000} 
    {Show Out}
    {Browse 'Resultado: [5 6 4] (A thread A=6 acorda o Filter e o Delay garante a conclusão).'}

in
    skip
end

/*
a)  A>2 -> A é unbound, logo a operação “>” não pode ser avaliada, 
thread suspende nessa instrução, esperando até que A seja ligada. 
Show suspende e também não exibe nada.

b)  verifica A>2 -> A é unbound, logo a operação “>” não pode ser avaliada, 
ao mesmo tempo, na execução principal temos {Show Out}, 
nesse ponto Out está parcialmente ligado. out é uma lista 5|(cauda ainda não ligada)
resultado exibido é [5|_]
Então sim, a função é determinística, 
lembrando que o que define o estado de um programa são os valores das variáveis na memória, 
o que é mostrado pelo Show não altera o estado, então é determinístico.

c)  Nenhuma outra thread liga valor a variável A, 
portanto durante o Delay o estado não muda
Após o atraso a operação {Show Out} mostra [5|_] ou ,
mas num geral vai mostrar [5|_], o que ainda assim não muda o resultado final.

d)  verifica A>2 -> A é unbound, logo a operação “>” não pode ser avaliada, 
no entanto temos uma outra thread que executa A=6, 
após essa ligação a thread volta e pode executar 6>5 -> true então agora temos Out = [5 6|_]
Continua  pro resto do vetor
resultato Out = [5 6 4]
*/