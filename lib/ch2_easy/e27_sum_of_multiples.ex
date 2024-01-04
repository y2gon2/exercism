defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  (https://exercism.org/tracks/elixir/exercises/sum-of-multiples)
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    to(limit, Enum.reject(factors, &(&1 == 0)), [])
  end

  defp to(_, [], result), do: Enum.sum(result)
  defp to(limit, [head | tail], result) do
    result = Enum.concat(
      result,
      Enum.filter(1..(limit - 1), &rem(&1, head) == 0)
    )
    |> Enum.uniq()

    to(limit, tail, result)
  end
end

# 다른 풀이
# https://exercism.org/tracks/elixir/exercises/sum-of-multiples/solutions/rsxb
