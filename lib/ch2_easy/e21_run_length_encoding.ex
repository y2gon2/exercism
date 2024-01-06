defmodule RunLengthEncoder do
  @doc """
  (https://exercism.org/tracks/elixir/exercises/run-length-encoding)
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    [pre_char | rest] = String.graphemes(string)
    reduce(rest, pre_char, 1, "")
  end

  @spec reduce([binary()], binary(), pos_integer(), String.t()) :: String.t()
  defp reduce([], pre_char, count, result) do
    cond do
      count > 1 -> result <> "#{count}" <> pre_char
      true -> result <> pre_char
    end
  end

  defp reduce([char | rest], pre_char, count, result) do
    cond do
      char == pre_char -> reduce(rest, pre_char, count + 1, result)
      count == 1 -> reduce(rest, char, 1, result <> pre_char)
      true -> reduce(rest, char, 1, result <> "#{count}" <> pre_char)
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    [pre_char | rest] = String.graphemes(string)
    unfold(rest, pre_char, "")
  end

  defp unfold([char | rest], pre_char, result) do
    if rest == [] do
      cond do
        Regex.match?(~r/\d+/, pre_char) -> result <> String.duplicate(char, String.to_integer(pre_char))
        true -> result <> pre_char <> char
      end
    else
      cond do
        Regex.match?(~r/\d+/, pre_char) and Regex.match?(~r/\d+/, char) -> unfold(
            rest, pre_char <> char, result
          )
          Regex.match?(~r/\d+/, pre_char) and Regex.match?(~r/[A-Za-z\s]/, char) -> unfold(
            rest,
            "",
            result <> String.duplicate(char, String.to_integer(pre_char))
          )
        true -> unfold(rest, char, result <> pre_char)
      end
    end
  end
end

# 다른 풀이
# https://exercism.org/tracks/elixir/exercises/run-length-encoding/solutions/silvadanilo
