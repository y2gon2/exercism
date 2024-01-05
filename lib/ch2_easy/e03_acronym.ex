defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  (https://exercism.org/tracks/elixir/exercises/acronym)
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r/[\s-_]+/)
    |> Enum.map(&String.first/1)
    |> Enum.join()
    |> String.upcase()
  end
end
