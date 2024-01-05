defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  (https://exercism.org/tracks/elixir/exercises/triangle)
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) do
    [min, mid, max] = Enum.sort([a, b, c])

    cond do
      min == max -> {:ok, :equilateral}
      mid == max -> {:ok, :isosceles}
      min + mid > max -> {:ok, :scalene}
      true -> {:error, "side lengths violate triangle inequality"}
    end
  end
end
