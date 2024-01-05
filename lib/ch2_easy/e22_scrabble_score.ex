defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  (https://exercism.org/tracks/elixir/exercises/scrabble-score)
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word), do: score(String.upcase(word), 0)

  defp score("", points), do: points
  defp score(<<char::size(8), rest::binary>>, points) do
    case char do
      x when x in [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T] -> score(rest, points + 1)
      x when x in 'DG' -> score(rest, points + 2)     #  다른 표현 방식 사용
      x when x in ~c"BCMP" -> score(rest, points + 3) #  다른 표현 방식 사용
      x when x in [?F, ?H, ?V, ?W, ?Y] -> score(rest, points + 4)
      ?K -> score(rest, points + 5)
      x when x in [?J, ?X] -> score(rest, points + 8)
      x when x in [?Q, ?Z] -> score(rest, points + 10)
      _ -> score(rest, points)
    end
  end
end
