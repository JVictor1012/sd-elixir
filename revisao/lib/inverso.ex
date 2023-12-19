defmodule Inverso do

  def inverso do
    IO.puts "Digite uma sequência de números: "
    numeros = IO.gets("") |> String.trim |> String.split(" ") |> Enum.reverse

    IO.puts " Sequência inversa é: #{Enum.join(numeros, ", ")}"
  end

end