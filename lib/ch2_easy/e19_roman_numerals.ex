defmodule RomanNumerals do
  @first_roman_numerals %{1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX"}
  @second_roman_numerals %{10 => "X", 20 => "XX", 30 => "XXX", 40 => "XL", 50 => "L", 60 => "LX", 70 => "LXX", 80 => "LXXX", 90 => "XC"}
  @third_roman_numerals %{100 => "C", 200 => "CC", 300 => "CCC", 400 => "CD", 500 => "D", 600 => "DC", 700 => "DCC", 800 => "DCCC", 900 => "CM"}
  @forth_roman_numerals %{1000 => "M", 2000 => "MM", 3000 => "MMM"}

  @doc """
  Convert the number to a roman number.
  (https://exercism.org/tracks/elixir/exercises/roman-numerals)
  """
  # @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    remain = rem(number, 10)
    first = first_roman(remain)
    number = number - remain

    remain = rem(number, 100)
    second = second_roman(remain)
    number = number - remain

    remain = rem(number, 1000)
    third = third_roman(remain)
    number = number - remain

    forth = forth_roman(rem(number, 10000))

    "#{forth}#{third}#{second}#{first}"
  end

  defp first_roman(num) when num <= 0, do: ""
  defp first_roman(num) when num > 0, do: Map.get(@first_roman_numerals, num)

  defp second_roman(num) when num <= 0, do: ""
  defp second_roman(num) when num > 0, do: Map.get(@second_roman_numerals, num)

  defp third_roman(num) when num <= 0, do: ""
  defp third_roman(num) when num > 0, do: Map.get(@third_roman_numerals, num)

  defp forth_roman(num) when num <= 0, do: ""
  defp forth_roman(num) when num > 0, do: Map.get(@forth_roman_numerals, num)
end
