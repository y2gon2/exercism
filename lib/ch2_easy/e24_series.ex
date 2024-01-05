defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  (https://exercism.org/tracks/elixir/exercises/series)
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    count = String.length(s) - size
    get_element(s, count, [], size)
  end

  defp get_element(_, count, _, size) when count < 0 or size <= 0, do: []
  defp get_element(s, 0, result, _), do: result ++ [s]
  defp get_element(<<_char, rest::binary>> = s, count, result, size) when count != 0 do
    result = result ++ [String.slice(s, 0..(size - 1))]
    get_element(rest, count - 1, result, size)
  end
end

# 다른 풀이 참조 Enum & Map 라이브러리 사용..
# https://exercism.org/tracks/elixir/exercises/series/solutions/solkrans
