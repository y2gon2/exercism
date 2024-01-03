defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.
  (https://exercism.org/tracks/elixir/exercises/raindrops)

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    result = number
    |> pling()
    |> plang(number)
    |> plong(number)

    if result == "" do
      Integer.to_string(number)
    else
      result
    end
  end

  defp pling(number) do
    if rem(number, 3) == 0 do
      "Pling"
    else
      ""
    end
  end

  defp plang(result, number) do
    if rem(number, 5) == 0 do
      result <> "Plang"
    else
      result
    end
  end

  defp plong(result, number) do
    if rem(number, 7) == 0 do
      result <> "Plong"
    else
      result
    end
  end
end
