defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.
  (https://exercism.org/tracks/elixir/exercises/strain/edit)

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: keep(list, fun, [])

  defp keep([], _fun, result), do: result
  defp keep([head | tail], fun, result) do
    if fun.(head) do
      keep(tail, fun, result ++ [head])
    else
      keep(tail, fun, result)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: discard(list, fun, [])

  defp discard([], _fun, result), do: result
  defp discard([head | tail], fun, result) do
    if fun.(head) do
      discard(tail, fun, result)
    else
      discard(tail, fun, result ++ [head])
    end
  end
end

# 다른 플이
# https://exercism.org/tracks/elixir/exercises/strain/solutions/DukeFruitarian
