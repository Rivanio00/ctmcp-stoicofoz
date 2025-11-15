# Definição do módulo da árvore
defmodule BinaryTree do
  # Esturura de um Nó
  # - value: o valor guardado (por exemplo, "A", "B", "C"...)
  # - left: o filho à esquerda
  # - right: o filho à direita
  defstruct value: nil, left: nil, right: nil

  @doc """
  Calcula as coordenadas (x, y) de todos os nós de uma árvore binária.

  Retorna uma tupla:
    {largura_total, lista_de_coordenadas}

  Onde:
    - largura_total é o número total de nós na base da árvore (usado para posicionar filhos)
    - lista_de_coordenadas contém pares (x, y), onde:
        x → posição horizontal do nó
        y → profundidade (nível) do nó na árvore
  """

  def calculate_coordinates(tree) do
    # Começa o cálculo a partir da raiz.
    # A profundidade inicial é 1 (raiz da árvore),
    # e o deslocamento horizontal inicial é 0.
    calculate_coordinates(tree, 1, 0)
  end

  # Caso base da recursão:
  # Se o nó for "nil" (ou seja, não existe), retorna largura 0 e lista vazia.
  defp calculate_coordinates(nil, _, _), do: {0, []}

  # Calcula as coordenadas de um nó e de suas subárvores.
  defp calculate_coordinates(%BinaryTree{left: left, right: right}, depth, x_offset) do
    # Calcula recursivamente as coordenadas das subárvores esquerda depois da direita
    # O nível (depth) aumenta em 1, e o deslocamento horizontal (x_offset) é o mesmo.
    {left_width, left_coords} = calculate_coordinates(left, depth + 1, x_offset)

    # O nível (depth) aumenta em 1, e o deslocamento horizontal (x_offset) somado a left_width(largura da subárvore esquerda) + 1.
    {right_width, right_coords} = calculate_coordinates(right, depth + 1, x_offset + left_width + 1)

    # Calcula a coordenada x do nó atual
    x_coord = x_offset + left_width

    # Combina as coordenadas do nó atual com as subárvores
    coords = [{x_coord, depth} | left_coords ++ right_coords]

    # Retorna a largura total da subárvore e a lista de coordenadas
    {left_width + right_width + 1, coords}
  end
end

# Definição do módulo principal (onde faremos um exemplo)
defmodule Main do
  def run do
    # Um exemplo de árvore binária
    # Monta manualmente uma árvore binária de exemplo:
    #
    #             A = 3
    #          /         \
    #     B = 1           C = 5
    #    /     \         /     \
    # D = 0   E = 2    F = 4   G = 6
    exemplo = %BinaryTree{
      value: "A",
      left: %BinaryTree{
        value: "B",
        left: %BinaryTree{value: "D"},
        right: %BinaryTree{value: "E"}
      },
      right: %BinaryTree{
        value: "C",
        left: %BinaryTree{value: "F"},
        right: %BinaryTree{value: "G"}
      }
    }

    # Calcula as coordenadas da árvore
    resultado = BinaryTree.calculate_coordinates(exemplo)

    # Imprime as coordenadas dos nós
    IO.inspect(resultado, label: "Coordenadas da Árvore")
  end
end

# Executa o programa
Main.run()


# Este algoritmo segue o modelo declarativo e não necessita de dataflow:
#   - Ele é puramente recursivo: cada chamada depende apenas do retorno das anteriores.
#   - Não há paralelismo, concorrência nem variáveis não-ligadas.
#   - Todas as variáveis são locais e têm valor definido imediatamente.
#   - Assim, não há dependências assíncronas ou atrasos de avaliação.

#   Em resumo: o programa é totalmente determinístico e síncrono, cada etapa depende exclusivamente de resultados já
#   totalmente calculados em chamadas anteriores
#   Variáveis não-ligadas só seriam necessárias se houvesse execução concorrente,
#   o que não é o caso aqui.
