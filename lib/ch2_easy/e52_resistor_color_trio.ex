defmodule ResistorColorTrio do
  @color_codes %{black: 0, brown: 1, red: 2, orange: 3, yellow: 4,
  green: 5 ,blue: 6, violet: 7, grey: 8, white: 9}

  @doc """
  Calculate the resistance value in ohms from resistor colors
  (https://exercism.org/tracks/elixir/exercises/resistor-color-trio)
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, decimal | _]) do
    value = (get_num(first) * 10 + get_num(second)) * Integer.pow(10, get_num(decimal))
    cond do
      value < 1_000 -> {value, :ohms}
      value < 1_000_000 -> {div(value, 1_000), :kiloohms}
      value < 1_000_000_000 -> {div(value, 1_000_000), :megaohms}
      true -> {div(value, 1_000_000_000), :gigaohms}
    end
  end

  defp get_num(key), do: Map.get(@color_codes, key)
end
