defmodule NucleotideCount do
  @moduledoc """
    (https://exercism.org/tracks/elixir/exercises/nucleotide-count)
  """
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.


  ## Examples

  iex> NucleotideCount.count(~c"AATAA", ?A)
  4

  iex> NucleotideCount.count(~c"AATAA", ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.count(strand, fn s -> s == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram(~c"AATAA")
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    for nucleotide <- @nucleotides, into: %{} do
      {nucleotide, count(strand, nucleotide)}
    end
  end
end
