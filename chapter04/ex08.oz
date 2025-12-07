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
        {Show {Filter [5 1 A1 4 0] fun {$ X} X>2 end}} % Apague essa linha* A1 é unbound, execução fica esperando que seja atribuído valor a ela
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