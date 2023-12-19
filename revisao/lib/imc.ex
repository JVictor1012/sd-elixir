defmodule Imc do

    def imc do
        IO.puts "Digite seu nome: "
        nome = IO.gets("") |> String.trim

        IO.puts "Digite seu peso em KG: "
        peso = IO.gets("") |> String.trim |> String.to_float

        IO.puts "Digite sua altura em cm: "
        altura_cm = IO.gets("") |> String.trim |> String.to_float

        altura_metros = altura_cm / 100

        imc = peso / (altura_metros * altura_metros)

        IO.puts "Olá, #{nome}! Seu IMC é #{imc}"
    end

end