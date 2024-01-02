defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  (https://exercism.org/tracks/elixir/exercises/darts)
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case :math.pow(x, 2) + :math.pow(y, 2) do
      r when r <= 1.0 -> 10
      r when r > 1.0 and r <= 25.0 -> 5
      r when r > 25.0 and r <= 100.0 -> 1
      _ -> 0
    end
  end
end
