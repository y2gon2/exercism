defmodule AllYourBase do

  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  (https://exercism.org/tracks/elixir/exercises/all-your-base)
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(digits, input_base, output_base) when input_base >= 2 do
    case to_decimal(digits, input_base, length(digits) - 1, 0) do
      {:ok, decimal} -> from_decimal(decimal, output_base, [])
      {:error, message} -> {:error, message}
    end
  end

  defp to_decimal([], _, _, total), do: {:ok, total}
  defp to_decimal([head | _], input_base, _, _) when head < 0 or head >= input_base do
    {:error, "all digits must be >= 0 and < input base"}
  end
  defp to_decimal([head | tail], input_base, position_of_num, total) do
    to_decimal(
      tail,
      input_base,
      position_of_num - 1,
      (head * Integer.pow(input_base, position_of_num)) + total
    )
  end

  defp from_decimal(0, _output_base, result_list) when result_list != [], do: {:ok, result_list}
  defp from_decimal(0, _output_base, []), do: {:ok, [0]}
  defp from_decimal(value, ouput_base, result_list) when value != 0 do
    from_decimal(
      trunc(value / ouput_base),
      ouput_base,
      [rem(value, ouput_base) | result_list]
    )
  end
end
