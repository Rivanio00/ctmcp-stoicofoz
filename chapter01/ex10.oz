/*A)
É possível obter 1, pois a última thread que executa é a que define o valor no final do
algoritmo, logo o interleaving das threads é não determinístico, o escalonador “decide” qual
ocorre primeiro.
B)
Isso muda o interleaving das threads, pois agora temos uma thread que vai demorar mais
pra rodar, caso adicione o delay apenas a uma das threads o fluxo se torna determinístico,
pois a que não tem delay vai executar antes.*/

%C)
thread
    {Delay 0.1}
    lock L then I in
        I = @C
        C := I + 1
    end
end

/*Mesmo adicionando o delay, o lock ainda garante a exclusão mútua, logo, a primeira thread
sempre faz sua operação completa antes da segunda entrar.*/