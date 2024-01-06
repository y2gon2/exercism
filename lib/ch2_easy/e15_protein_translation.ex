defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  (https://exercism.org/tracks/elixir/exercises/protein-translation)
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna), do: of_rna(rna, [])

  defp of_rna("", result), do: {:ok, result}
  defp of_rna(rna, result) do
    {head, rest} = String.split_at(rna, 3)

    case of_codon(head) do
      {:ok, code} when code == "STOP" -> {:ok, result}
      {:ok, code} when code == tl(result) -> of_rna(rest, result)
      {:ok, code} -> of_rna(rest, result ++ [code])
      {:error, "invalid codon"} -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    cond do
      codon == [] -> {:ok, []}
      codon in ~w(UGU UGC) -> {:ok, "Cysteine"}
      codon in ~w(UUA UUG) -> {:ok, "Leucine"}
      codon in ~w(AUG) -> {:ok, "Methionine"}
      codon in ~w(UUU UUC) -> {:ok, "Phenylalanine"}
      codon in ~w(UCU UCC UCA UCG) -> {:ok, "Serine"}
      codon in ~w(UGG) -> {:ok, "Tryptophan"}
      codon in ~w(UAU UAC) -> {:ok, "Tyrosine"}
      codon in ~w(UAA UAG UGA) -> {:ok, "STOP"}
      true -> {:error, "invalid codon"}
    end
  end
end
