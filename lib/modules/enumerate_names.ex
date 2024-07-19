defmodule EnumerateNames do
  @roman_numerals [
    {10000, "X̅"},
    {9000, "M̅X̅"},
    {5000, "V̅"},
    {4000, "M̅V̅"},
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def enumerate_names(names) do
    names
    |> process_names()
  end

  def print_inputed(names) do
    Enum.each(names, &IO.puts/1)
  end

  defp process_names(names) do
    {reversed_result, _counts} =
      Enum.reduce(names, {[], %{}}, fn name, {acc, counts} ->
        count = Map.get(counts, name, 0) + 1
        updated_name = "#{name} #{to_roman_numeral(count)}"

        updated_acc = [updated_name | acc]
        updated_counts = Map.put(counts, name, count)

        {updated_acc, updated_counts}
      end)

    Enum.reverse(reversed_result)
  end

  def to_roman_numeral(0), do: ""
  def to_roman_numeral(n) when n < 0 do
    raise ArgumentError, "Number must be non-negative"
  end
  def to_roman_numeral(n) do
    {value, numeral} = Enum.find(@roman_numerals, fn {value, _} -> value <= n end)
    numeral <> to_roman_numeral(n - value)
  end
end
