defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.
  (https://exercism.org/tracks/elixir/exercises/secret-handshake/edit)

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: commands(code, [])

  defp commands(0, result), do: result
  defp commands(code, result) when code > 0 do
    case code do
      code when rem(code, 0b00010) == 0b00001 -> commands(code - 0b00001, result ++ ["wink"])
      code when rem(code, 0b00100) == 0b00010 -> commands(code - 0b00010, result ++ ["double blink"])
      code when rem(code, 0b01000) == 0b00100 -> commands(code - 0b00100, result ++ ["close your eyes"])
      code when rem(code, 0b10000) == 0b01000 -> commands(code - 0b01000, result ++ ["jump"])
      0b10000 -> commands(0b00000, Enum.reverse(result))
      _ -> []
    end
  end
end
