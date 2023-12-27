defmodule DNA do
  @moduledoc """
  Exercise Learning goals
  * Tail Call Recursion
  (https://exercism.org/tracks/elixir/exercises/dna-encoding)
  """
  @nucleic_acid_to_binary_codes %{
    ?\s  => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @binary_to_nucleic_acid_codes %{
    0b0000 => ?\s,
    0b0001 => ?A,
    0b0010 => ?C,
    0b0100 => ?G,
    0b1000 => ?T
  }

  @size 4

  def encode_nucleotide(code_point) do
    @nucleic_acid_to_binary_codes[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @binary_to_nucleic_acid_codes[encoded_code]
  end

  def encode(list) do
    encode(list, <<>>)
  end

  defp encode(~c"", total), do: total
  defp encode([head | tail], total) do
    encode(tail, <<total::bitstring, (<<encode_nucleotide(head)::@size>>)::bitstring>>)
  end

  def decode(list) do
    decode(list, ~c"")
  end

  defp decode(<<>>, total), do: total
  defp decode(<<head::size(@size), tail::bitstring>>, total) do
    decode(tail, total ++ [decode_nucleotide(head)])
  end
end
