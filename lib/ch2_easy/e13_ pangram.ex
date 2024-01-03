defmodule Pangram do
  # @alphabet "abcdefghijklmnopqrstuvwxyz"

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.
  (https://exercism.org/tracks/elixir/exercises/pangram)

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true
  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    # sentence
    # |> String.downcase()
    # |> String.replace(~r/[ _.]/, "")
    # |> String.graphemes()
    # |> Enum.sort()
    # |> Enum.uniq()
    # |> Enum.join()
    # |> String.contains?(@alphabet)

    chars = sentence |> String.downcase() |> String.to_charlist()
    Enum.all?(?a..?z, fn e -> e in chars end)
  end
end
