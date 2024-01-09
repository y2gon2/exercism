defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  (https://exercism.org/tracks/elixir/exercises/proverb)
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite([prev | tail]) do
    result = Stream.resource(
      fn -> {tail, {prev, prev}} end,
      fn
        {[], {"", ""}} -> {:halt, nil}
        {[], {first, _prev}} -> {[last(first)], {[], {"", ""}}}
        {[cur | tail], {first, prev}} -> {[others(prev, cur)], {tail, {first, cur}}}
      end,
      fn _ -> nil end
    )
    Enum.to_list(result)
    |> Enum.join("")
  end
  defp last(first), do: "And all for the want of a #{first}.\n"
  defp others(prev, cur), do: "For want of a #{prev} the #{cur} was lost.\n"
end
