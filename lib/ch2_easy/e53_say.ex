defmodule Say do
  @digits %{1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
  6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 0 => ""}

  @tens %{2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty",
  7 => "seventy", 8 => "eighty", 9 => "ninety", 1 => "", 0 => ""}

  @doc """
  Translate a positive integer into English.
  (https://exercism.org/tracks/elixir/exercises/say)
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number < 0 or number > 999_999_999_999, do: {:error, "number is out of range"}
  def in_english(number) when number == 0, do: {:ok, "zero"}
  def in_english(number), do: {:ok, transform(number, "") |> String.trim()}

  defp transform(number, result) do
    cond do
      number < 1_000 -> result <> three_digits(number)
      number < 1_000_000 -> transform(
        rem(number, 1_000),
        result <> three_digits(div(number, 1_000)) <> " thousand "
        )
      number < 1_000_000_000 ->transform(
        rem(number, 1_000_000),
        result <> three_digits(div(number, 1_000_000)) <> " million "
        )
      true -> transform(
        rem(number, 1_000_000_000),
        result <> three_digits(div(number, 1_000_000_000)) <> " billion "
        )
    end
  end

  defp three_digits(n) do
    third = rem(n, 10)
    second = rem(div(n, 10), 10)
    first = rem(div(n, 100), 10)

    case {first, second, third} do
      {0, 1, 1} -> "eleven"
      {0, 1, 2} -> "twelve"
      {0, 1, 3} -> "thirteen"
      {0, 1, 4} -> "fourteen"
      {0, 1, 5} -> "fifteen"
      {0, 1, 6} -> "sixteen"
      {0, 1, 7} -> "seventeen"
      {0, 1, 8} -> "eighteen"
      {0, 1, 9} -> "nineteen"
      {0, 0, _} -> Map.get(@digits, third)
      {0, _, _} -> if third == 0, do: Map.get(@tens, second), else: "#{Map.get(@tens, second)}-#{Map.get(@digits, third)}"
      {_, _, _} ->
        nums = if third == 0 do
          [Map.get(@digits, first), Map.get(@tens, second)]
        else
          [Map.get(@digits, first), "#{Map.get(@tens, second)}-#{Map.get(@digits, third)}"]
        end
        Enum.join(nums, " hundred ")
    end
  end
end
