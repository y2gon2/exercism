defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.
  (https://exercism.org/tracks/elixir/exercises/perfect-numbers)

  # 다른 풀이: (https://exercism.org/tracks/elixir/exercises/perfect-numbers/solutions)

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0, do: {:error, "Classification is only possible for natural numbers."}
  def classify(number) when number == 1 or number == 2, do: {:ok, :deficient}
  def classify(number) do
    {_, result} = Enum.map_reduce(1..div(number, 2), 0, fn x, acc -> if rem(number, x) == 0, do: {x, x + acc}, else: {x, acc} end)

    cond do
      result == number -> {:ok, :perfect}
      result > number -> {:ok, :abundant}
      result < number -> {:ok, :deficient}
    end
  end
end
