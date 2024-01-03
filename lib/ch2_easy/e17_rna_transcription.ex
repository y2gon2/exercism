defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA
  (https://exercism.org/tracks/elixir/exercises/rna-transcription)

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for nucleotide <- dna do
      case nucleotide do
        ?G -> ?C
        ?C -> ?G
        ?T -> ?A
        ?A -> ?U
      end
    end
  end
end
