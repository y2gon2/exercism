defmodule ResistorColorDuo do
  @color_codes %{black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9}

  @doc """
  Calculate a resistance value from two colors
  (https://exercism.org/tracks/elixir/exercises/resistor-color-duo)
  """
  def value([first | [second | _rest]]) do
    Map.get(@color_codes, first) * 10 + Map.get(@color_codes, second)
  end
end
