defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.
  (https://exercism.org/tracks/elixir/exercises/prime-factors)

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    count(number, 2, [])
    |> Enum.reverse()
  end

  defp count(1, _n, result), do: result
  defp count(number, n, result) do
    if rem(number, n) == 0 do
      count(div(number, n), n, [n | result])
    else
      count(number, n + 1, result)
    end
  end
end
