defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.
  (https://exercism.org/tracks/elixir/exercises/rotational-cipher)

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    result = for char <- String.to_charlist(text) do
      new_char = char + shift
      case char do
        char when char in ?A..?Z -> if new_char > ?Z, do: new_char - 26, else: new_char
        char when char in ?a..?z -> if new_char > ?z, do: new_char - 26, else: new_char
        _ -> char
      end
    end
    List.to_string(result)
  end
end
