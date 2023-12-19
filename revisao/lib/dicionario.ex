defmodule Dicionario do

    def principal do
        loop(%{})
    end

    def loop(dic) do
        IO.puts "Digite seu Nome:"
        nome = IO.gets("") |> String.trim

        IO.puts "Digite sua matricula:"
        matricula = IO.gets("") |> String.trim

        novo_dic = Map.put(dic, matricula, nome)

        IO.puts "Lista de Nomes:"
        Enum.each(novo_dic, fn {n, m} -> IO.puts "Nome: #{n}, Matricula: #{m}" end)

        loop(novo_dic)
    end

end