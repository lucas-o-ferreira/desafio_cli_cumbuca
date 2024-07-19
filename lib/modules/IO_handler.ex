defmodule IOHandler do

  def display_welcome_message() do
    IO.puts("Welcome!")
    IO.puts("Enter names, pressing the Enter key after each one.")
    IO.puts("They will be enumerated with Roman numerals.")
  end

  def help_message() do
    IO.puts("""
    This is a command-line tool for adding roman numerals to the end of names.

    Usage:
      To use this app just start it.
      Enter a name, followed by the Enter key.
      To end the list of names just press enter twice.

    For more information, visit the project repository at:
      https://github.com/lucas-o-ferreira/desafio_cli_cumbuca

    Author: Lucas Ferreira
    Version: 1.0.0
    """)
  end

  def read_names(list) do
    name = IO.read(:stdio, :line)
    case name do
      "\n" ->
        Enum.reverse(list)

      _ ->
        trimmed_name = String.trim(name)
        updated_list = [trimmed_name | list]
        read_names(updated_list)
    end
  end

  def print_enumerated_names(names) do
    IO.puts("Here's the enumerated list:")
    Enum.each(names, &IO.puts/1)
  end

  def end_or_continue() do
    IO.puts("Do you wish to continue using this program?(S/n)")
    case IO.gets("")
    |> String.trim() do
      input when input in ["s", "S", ""] -> DesafioCli.start()
      input when input in ["n", "N"] -> IO.puts("Ending execution! Bye")
      _ ->
      IO.puts("Invalid Input.")
      end_or_continue()
    end
  end

end
