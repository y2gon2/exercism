defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  (https://exercism.org/tracks/elixir/exercises/gigasecond)
  """
  # @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
  #         {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {:ok, now} = NaiveDateTime.new(Date.new!(year, month, day), Time.new!(hours, minutes, seconds))
    future = NaiveDateTime.add(now, 1_000_000_000)
    {{future.year, future.month, future.day}, {future.hour, future.minute, future.second}}

    # datetime
    # |> NaiveDateTime.from_erl!()
    # |> NaiveDateTime.add(1_000_000_000)
    # |> NaiveDateTime.to_erl()
  end
end
