type Stream a = [a]

-- FUNÇÕES DE PORTA LÓGICA BÁSICAS (OPERAM EM VALORES)

-- NOT (apenas para um único valor)
notF :: Int -> Int
notF x = 1 - x

-- AND (apenas para um único valor)
andF :: Int -> Int -> Int
andF x y = x * y

-- OR (apenas para um único valor)
orF :: Int -> Int -> Int
orF x y = x + y - x * y

-- XOR (apenas para um único valor)
xorF :: Int -> Int -> Int
xorF x y = x + y - 2 * x * y

-- NAND (apenas para um único valor)
nandF :: Int -> Int -> Int
nandF x y = 1 - x * y

-- NOR (apenas para um único valor)
norF :: Int -> Int -> Int
norF x y = 1 - (x + y - x * y)

-- PORTAS LÓGICAS QUE OPERAM EM STREAMS
-- Em Haskell o MAP já é naturalmente lazy

notG :: Stream Int -> Stream Int
notG = map notF

-- GERADOR DE PORTAS BINÁRIAS (GateMaker)
gateMaker :: (Int -> Int -> Int) -> Stream Int -> Stream Int -> Stream Int
gateMaker f = zipWith f

-- Portas Binárias em Stream
andG :: Stream Int -> Stream Int -> Stream Int
andG = gateMaker andF

orG :: Stream Int -> Stream Int -> Stream Int
orG = gateMaker orF

xorG :: Stream Int -> Stream Int -> Stream Int
xorG = gateMaker xorF

nandG :: Stream Int -> Stream Int -> Stream Int
nandG = gateMaker nandF

norG :: Stream Int -> Stream Int -> Stream Int
norG = gateMaker norF


-- CIRCUITOS

-- HALF ADDER
halfAdder :: Stream Int -> Stream Int -> (Stream Int, Stream Int)
halfAdder a b = (s, c)
  where
    s = xorG a b -- Stream da Soma
    c = andG a b -- Stream do Carry

-- MUX 2->1
mux2to1 :: Stream Int -> Stream Int -> Stream Int -> Stream Int
mux2to1 a b sel = out
  where
    nS = notG sel    -- NS = NOT Sel
    t1 = andG a nS   -- T1 = A AND (NOT Sel)
    t2 = andG b sel  -- T2 = B AND Sel
    out = orG t1 t2  -- Out = T1 OR T2

-- Comparador de Bit
comparator1 :: Stream Int -> Stream Int -> Stream Int
comparator1 a b = eq
  where
    x = xorG a b -- X = A XOR B
    eq = notG x  -- EQ = NOT X (XNOR)


-- MAIN
main :: IO ()
main = do

  let a = [0, 1, 0, 1] -- Equivalente a A = 0|1|0|1|_
  let b = [0, 0, 1, 1] -- Equivalente a B = 0|0|1|1|_
  let s = [0, 1, 0, 1] -- Stream de Seleção

  -- Executando os circuitos e conectando os streams
  let (hs, hc) = halfAdder a b
  let mOut = mux2to1 a b s
  let eq = comparator1 a b

  -- Print Resultados
  putStrLn "--- Simulação de Circuito Lazy ---"
  putStrLn $ "Entrada A: " ++ show a
  putStrLn $ "Entrada B: " ++ show b
  putStrLn "---"
  putStrLn $ "HalfAdder - Soma (HS): " ++ show hs
  putStrLn $ "HalfAdder - Carry (HC): " ++ show hc
  putStrLn "---"
  putStrLn $ "Mux Output (MOut): " ++ show mOut
  putStrLn $ "Comparator EQ (EQ): " ++ show eq
