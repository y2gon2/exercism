defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  (https://exercism.org/tracks/elixir/exercises/sublist)
  """
  def compare([], []), do: :equal
  def compare(_a, []), do: :superlist
  def compare([], _b), do: :sublist
  def compare(a, b) do
    cond do
      length(a) == length(b) -> if a === b, do: :equal, else: :unequal
      length(a) > length(b) -> if sub?(a,b), do: :superlist, else: :unequal
      true -> if sub?(b, a), do: :sublist, else: :unequal
    end
  end

  defp sub?([], _small_list), do: false
  defp sub?(large_list, small_list) do
    if List.starts_with?(large_list, small_list) do
      true
    else
      sub?(tl(large_list), small_list)
    end
  end
end
