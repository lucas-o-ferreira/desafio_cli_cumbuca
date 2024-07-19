defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(args) do
    case args do
      ["--help"] -> IOHandler.help_message()
      _ ->
        IOHandler.display_welcome_message()
        start()
    end

  end

  def start() do
    IO.puts("You can start typing names below!")
    enumerated_names(get_names()) |> IOHandler.print_enumerated_names()
    IOHandler.end_or_continue()
  end

  def get_names() do
    IOHandler.read_names([])
  end

  def enumerated_names(names) do
    EnumerateNames.enumerate_names(names)
  end
end
