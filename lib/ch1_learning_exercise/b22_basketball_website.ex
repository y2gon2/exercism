defmodule BasketballWebsite do
  @moduledoc """
  Exercise Learning goals
  * Access Behaviour
  (https://exercism.org/tracks/elixir/exercises/basketball-website)
  """

  def extract_from_path(data, path) do
    [head | tail] = String.split(path, ".")
    matching_value(data[head], tail)
  end

  defp matching_value(data, []), do: data
  defp matching_value(data, [head | tail]) do
    matching_value(data[head], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
