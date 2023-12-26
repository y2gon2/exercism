defmodule BirdCount do
  @moduledoc """
  Exercise Learning goals
  * Recursion
  (https://exercism.org/tracks/elixir/exercises/bird-count)
  """
    def today([]), do: nil
    def today([first | _]), do: first

    def increment_day_count([]), do: [1]
    def increment_day_count(list) do
      [first | tail] = list
      [first + 1 | tail]
    end

    def has_day_without_birds?([]), do: false
    def has_day_without_birds?([0 | _]), do: true
    def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

    def total([]), do: 0
    def total([head | tail]), do: head + total(tail)

    def busy_days([]), do: 0
    def busy_days([head | tail]) do
      if head >= 5 do
        1 + busy_days(tail)
      else
        busy_days(tail)
      end
    end
end
