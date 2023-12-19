defmodule Saudacoes do
  
  def hello do
    IO.puts "Hello world!"
  end

  def ola do
    IO.puts "Digite seu nome: "
    nome = IO.gets("") |> String.trim
    IO.puts "Olá #{nome}!"
  end

  def saudacao do
    IO.puts "Digite seu nome: "
    IO.puts "Digite seu aniversário: "
    nome = IO.gets("") |> String.trim
    aniversario = IO.gets("") |> String.trim |> String.to_integer

    idade = Date.utc_today().year - aniversario
    IO.puts "Olá #{nome}!, você tem #{idade} anos!"

  end

end
