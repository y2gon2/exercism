defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  (https://exercism.org/tracks/elixir/exercises/anagram)
  """

  def match(base, canditates), do: match(base, canditates, [])
  defp match(_base, candidates, result) when candidates == [], do: result
  defp match(base, [head | tail], result) do
    if verify?(base, head) do
      match(base, tail, result ++ [head])
    else
      match(base, tail, result)
    end
  end

  defp verify?(base, candidate) do
    base_down = String.downcase(base)
    candidate_down = String.downcase(candidate)

    if base_down == candidate_down or String.length(base) != String.length(candidate_down) do
      false
    else
      sorted(base_down) == sorted(candidate_down)
    end
  end

  defp sorted(word) do
    word
    |> String.graphemes
    |> Enum.sort
  end
end
