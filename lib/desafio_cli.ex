defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(_args) do
    display_welcome_message()
    start()
  end

  defp display_welcome_message() do
    IO.puts("Welcome!")
    IO.puts("Enter names, pressing the Enter key after each one.")
    IO.puts("They will be enumerated with Roman numerals.")
  end

  def start() do
    IO.puts("You can start typing names below!")
    print(enumerated_names(get_names()))
    end_or_continue()
  end

  def get_names() do
    GetNames.read_names([])
  end

  def enumerated_names(names) do
    EnumerateNames.enumerate_names(names)
  end

  def print(names) do
    IO.puts("Here's the enumerated list:")
    EnumerateNames.print_inputed(names)
  end

  def end_or_continue() do
    IO.puts("Do you wish to continue using this program?(S/n)")
    case IO.gets("")
    |> String.trim() do
      input when input in ["s", "S", ""] -> start()
      input when input in ["n", "N"] -> IO.puts("Ending execution! Bye")
      _ ->
      IO.puts("Invalid Input.")
      end_or_continue()
    end
  end
end
