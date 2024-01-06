defmodule Bob do
  @moduledoc """
  https://exercism.org/tracks/elixir/exercises/bob
  """

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)
    cond do
      no_words?(input) -> "Fine. Be that way!"
      shout?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      shout?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp question?(input), do: String.ends_with?(input, "?")
  defp no_words?(input), do: Regex.replace(~r/[\s*]/, input, "") == ""
  defp shout?(input), do: input == String.upcase(input) and input != String.downcase(input)
end
