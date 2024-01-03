defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.
  (https://exercism.org/tracks/elixir/exercises/etl)

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    for {point, words} <- input, word <- words, into: %{} do
      {String.downcase(word), point}
    end
  end
end
