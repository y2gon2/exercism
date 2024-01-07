defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  (https://exercism.org/tracks/elixir/exercises/isogram)
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    char_list = String.replace(sentence, ~r/[\s-]/, "")
      |> String.downcase()
      |> String.codepoints()

    unque_list = Enum.uniq(char_list)

    char_list == unque_list
  end
end
