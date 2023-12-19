defmodule Crud do
  def principal do
    loop(%{})
  end

  def loop(pontos) do
    IO.puts "Sistema Final"
    IO.puts "============="
    IO.puts "1. Criar"
    IO.puts "2. Listar"
    IO.puts "3. Atualizar"
    IO.puts "4. Excluir"
    IO.puts "5. Sair"

    IO.puts "Entre com sua opção: "
    opcao = IO.gets("") |> String.trim |> String.to_integer()

    case opcao do
      1 -> criar(pontos)
      2 -> listar(pontos)
      3 -> atualizar(pontos)
      4 -> excluir(pontos)
      5 -> sair()
      _ -> 
        IO.puts "Opção inválida"
        loop(pontos)
    end
  end

  def criar(pontos) do
    IO.puts "Digite as coordenadas x e y: "
    entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case entrada do
      [x, y] ->
        novo_pontos = Map.put(pontos, {x, y}, true)
        IO.puts "Ponto criado com sucesso!"
        loop(novo_pontos)
      _ ->
        IO.puts "Entrada inválida. Tente novamente."
        criar(pontos)
    end
  end

  def listar(pontos) do
    IO.puts "Pontos cadastrados:"
    Enum.each(pontos, fn {{x, y}, _} ->
      IO.puts "Ponto: {#{x}, #{y}}"
    end)
    loop(pontos)
  end

  def atualizar(pontos) do
    IO.puts "Digite as coordenadas x e y:"
    entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case entrada do
      [x, y] ->
        if Map.has_key?(pontos, {x, y}) do
          IO.puts "Digite as novas coordenadas:"
          novas_coordenadas = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
          
          case novas_coordenadas do
            [novo_x, novo_y] ->
              novo_pontos = Map.update(pontos, {x, y}, true, fn _ -> {novo_x, novo_y} end)
              IO.puts "Ponto atualizado com sucesso!"
              loop(novo_pontos)
            _ ->
              IO.puts "Entrada inválida. Tente novamente."
              atualizar(pontos)
          end
        else
          IO.puts "Ponto não encontrado. Tente novamente."
          atualizar(pontos)
        end
      _ ->
        IO.puts "Entrada invalida"
        atualizar(pontos)
    end
  end

  def excluir(pontos) do
    IO.puts "Digite as coordenadas x e y:"
    entrada = IO.gets("") |> String.trim |> String.split(" ") |> Enum.map(&String.to_integer/1)
    
    case entrada do
      [x, y] ->
        if Map.has_key?(pontos, {x, y}) do
          novo_pontos = Map.delete(pontos, {x, y})
          IO.puts "Ponto excluído!"
          loop(novo_pontos)
        else
          IO.puts "Ponto não encontrado."
          excluir(pontos)
        end
      _ ->
        IO.puts "Entrada inválida."
        excluir(pontos)
    end
  end

  def sair do
    IO.puts "Sistema encerrado."
    :ok
  end
end

