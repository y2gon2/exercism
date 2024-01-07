defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier
    (https://exercism.org/tracks/elixir/exercises/isbn-verifier)

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false
  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn_digits = String.replace(isbn, "-", "")
    if valid_digits?(isbn_digits) do
      if rem(calculate(isbn_digits), 11) == 0, do: true, else: false
    else
      false
    end
  end

  defp valid_digits?(isbn_digits) do
    if String.length(isbn_digits) == 10 do
      {pre_code, last_code} = String.split_at(isbn_digits, 9)
      cond do
        !Regex.match?(~r/[a-zA-Z+]/, pre_code) and Regex.match?(~r/[X0-9]/, last_code) -> true
        true -> false
      end
    else
      false
    end
  end

  defp calculate(isbn_digits) do
    String.graphemes(isbn_digits)
    |> Enum.map(fn e -> if e == "X", do: 10, else: String.to_integer(e) end)
    |> Enum.reverse()
    |> Enum.with_index(1)
    |> Enum.map(fn {idx, n} -> idx * n end)
    |> Enum.reduce(fn x, acc -> acc + x end)
  end

  # 다른 풀이
  # https://exercism.org/tracks/elixir/exercises/isbn-verifier/solutions/robinhilliard
end
