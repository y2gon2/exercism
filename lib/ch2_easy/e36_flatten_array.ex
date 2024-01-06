defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.
    (https://exercism.org/tracks/elixir/exercises/flatten-array)

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list(any())) :: list
  def flatten(list), do: flatten(list, [])

  defp flatten([], result), do: result
  defp flatten([head | tail], result) do
    cond do
      head == nil -> flatten(tail, result)
      is_integer(head) -> flatten(tail, result ++ [head])
      true ->
        result = result ++ flatten(head, [])
        flatten(tail, result)
    end
  end

  # 다른사람의 효율적 풀이 (다만 tail recursion 은 아니므로 성능적으로는 효율적이지 않음)
  # def flatten([]), do: []
  # def flatten(nil), do: []
  # def flatten([xh | xt]), do: flatten(xh) ++ flatten(xt)
  # def flatten(x), do: [x]

end
