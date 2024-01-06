defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext
  (https://exercism.org/tracks/elixir/exercises/atbash-cipher)

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  # @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    Regex.replace(~r/[,.\s]/, plaintext, "")
    |> String.downcase()
    |> String.codepoints()
    |> Enum.chunk_every(5)
    |> Enum.map(&transform/1)
    |> Enum.join(" ")
  end

  defp transform(chunk) do
    Enum.map(chunk, &new_char/1)
    |> Enum.join()
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    String.replace(cipher, " ", "")
    |> String.codepoints()
    |> Enum.map(&new_char/1)
    |> Enum.join()
  end

  defp new_char(char) do
    if Regex.match?(~r/[0-9]/, char) do
      char
    else
      char_code = String.to_charlist(char) |> hd()
      new_code = abs(?z - char_code) + ?a
      <<new_code>>
    end
  end
end
