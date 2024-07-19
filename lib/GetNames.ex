defmodule GetNames do
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
end
