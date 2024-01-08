defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  (https://exercism.org/tracks/elixir/exercises/pascals-triangle)
  """
  @spec rows(integer) :: [[integer]]
  def rows(num), do: next(num, 1, [[1]])

  defp next(num, floor, result) when num == floor, do: result
  defp next(num, floor, result) do
    row = for idx <- 0..floor do
      case idx do
        0 -> 1
        ^floor -> 1
        _ -> Enum.fetch!(List.last(result), idx - 1) + Enum.fetch!(List.last(result), idx)
      end
    end
    next(num, floor + 1, result ++ [row])
  end
end
