/*
a)
1 - thread B = true ocorre primeiro
    faz-se if B(true) -> printa yes
    thread B = false gera erro e encerra(variável B já ligada)

2 - thread B = false ocorre primeiro
    faz-se if B(false) -> não printa
    thread B = true gera erro e encerra(variável B já ligada)
    
3 - faz-se if B(não ligado) -> por ter variáveis dataflow espera que seja atribuído algum valor
    3.1 - thread B = true ocorre primeiro
          if B(true) -> printa yes
          thread B = false gera erro e encerra(variável B já ligada)
    3.2 - thread B = false ocorre primeiro
          if B(false) -> não printa
          thread B = true gera erro e encerra(variável B já ligada)
          
b)
caso tenhamos que
    thread B = true
    thread B = false (erro) -> a duas threads brigam pela mesma variável instanciável
    Para evitar a terminação anormal, devemos usar uma Célula      
*/
local B in
  B = {NewCell true}
  thread B := true  end
  thread B := false end
  {Delay 200} % Delay para garantir que as threads rodam
  if @B then {Browse yes} end
end