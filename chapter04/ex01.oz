/*local B in
    thread B=true end
    thread B=false end
    if B then {Browse yes}
    end
end
*/

/*
a)
1 - thread B = true ocorre primeiro
    faz-se if B(true) -> printa yes

2 - thread B = false ocorre primeiro
    faz-se if B(false) -> não printa
    
3 - faz-se if B(não ligado) -> por ter variáveis dataflow espera que seja atribuído algum valor
    3.1 - thread B = true ocorre primeiro
          if B(true) -> printa yes
    3.2 - thread B = false ocorre primeiro
          if B(false) -> não printa

          
b)
caso tenhamos que
    thread B = true
    thread B = false (erro) -> a duas threads brigam pela mesma variável instanciável       
*/
local B in
  B = {NewCell true}
  thread B := true  end
  thread B := false end
  {Delay 200}
  if @B then {Browse yes} end
end