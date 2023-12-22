defmodule KitchenCalculator do
  @moduledoc """
  Exercise Learning goals
  * Tuples
  * Pattern Matching
  (https://exercism.org/tracks/elixir/exercises/kitchen-calculator)
  """

  def get_volume({_unit, num}) do
    # Please implement the get_volume/1 function
    num
  end

  def to_milliliter({unit, num}) do
    # Please implement the to_milliliter/1 functions
    cond do
      unit == :cup -> {:milliliter, num * 240}
      unit == :fluid_ounce -> {:milliliter, num * 30}
      unit == :teaspoon -> {:milliliter, num * 5}
      unit == :tablespoon -> {:milliliter, num * 15}
      unit == :milliliter -> {:milliliter, num}
    end
  end

  def from_milliliter({_, num}, unit) do
    # Please implement the from_milliliter/2 functions
    cond do
      unit == :cup -> {unit, num / 240.0}
      unit == :fluid_ounce -> {unit, num / 30.0}
      unit == :teaspoon -> {unit, num / 5.0}
      unit == :tablespoon -> {unit, num / 15.0}
      unit == :milliliter -> {unit, num}
    end
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
