defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  @roman_numerals [
    {10, "X"},
    {9, "IX"},
    {8, "VIII"},
    {7, "VII"},
    {6, "VI"},
    {5, "V"},
    {4, "IV"},
    {3, "III"},
    {2, "II"},
    {1, "I"}
  ]

  def main(_args) do
    welcome_message()
    start()
  end

  def welcome_message() do
    IO.puts("Welcome!")
    IO.puts("Enter names, pressing the Enter key after each one.")
    IO.puts("They will be enumerated with Roman numerals.")
  end

  def start() do
    IO.puts("You can start typing names below!")
    names = read_names([])
    process_names(names)
    end_or_continue()
  end

  def read_names(acc) do
    case IO.read(:stdio, :line) do
      "\n" -> Enum.reverse(acc)
      name ->
        read_names([String.trim(name) | acc])
    end
  end

  def process_names(names) do
    Enum.reduce(names, {[], %{}}, fn name, {acc, counts} ->
      count = Map.get(counts, name, 0) + 1
      suffix = roman_numeral(count)
      updated_name = "#{name} #{suffix}"
      {acc ++ [updated_name], Map.put(counts, name, count)}
    end)
    |> elem(0)
    |> Enum.each(&IO.puts/1)
  end

  def roman_numeral(n) when n > 10 do
    "At the moment this demo only supports up to non-unique 10 names"
  end

  def roman_numeral(n) do
    Enum.find_value(@roman_numerals, fn {id, value} ->
    if n == id, do: value, else: nil end)
  end

  def end_or_continue() do
    IO.puts("Do you wish to continue using this program?(S/n)")
    case IO.gets("")
    |> String.trim() do
      input when input in ["s", "S", ""] -> start()
      input when input in ["n", "N"] -> IO.puts("Ending execution! Bye")
      _ -> IO.puts("Invalid Input. Ending execution.")
    end
  end
end
