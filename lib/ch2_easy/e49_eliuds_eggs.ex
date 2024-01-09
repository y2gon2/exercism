defmodule PopCount do
  import Bitwise

  @doc """
  Given the number, count the number of eggs.
  (https://exercism.org/tracks/elixir/exercises/pop-count)
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number), do: bits_count(number, 0)

  defp bits_count(0, result), do: result
  defp bits_count(number, result) do
    bits_count(number >>> 1, band(number, 1) + result)
  end
end
