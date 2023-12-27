defmodule LibraryFees do
  @moduledoc """
  Exercise Learning goals
  * Dates and Time
  (https://exercism.org/tracks/elixir/exercises/library-fees)
  """

  def datetime_from_string(string) do
    {:ok, date_time} = NaiveDateTime.from_iso8601(string)
    date_time
  end

  def before_noon?(datetime) do
    today_noon = datetime
    |> only_day()
    |> NaiveDateTime.new!(~T[12:00:00])

    NaiveDateTime.before?(datetime, today_noon)
  end

  def return_date(checkout_datetime) do
    today = only_day(checkout_datetime)

    if before_noon?(checkout_datetime) do
      Date.add(today, 28)
    else
      Date.add(today, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = actual_return_datetime
      |> only_day()
      |>Date.diff(planned_return_date)

    if  diff > 0 do
      diff
    else
      0
    end
  end

  def monday?(datetime) do
    day_of_week = only_day(datetime)
    |> Date.day_of_week()

    if day_of_week == 1 do
      true
    else
      false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_date = checkout
      |> datetime_from_string()
      |> return_date()
    returned_date = return
      |> datetime_from_string()

    delay = days_late(planned_date, returned_date)
    original_fee = rate * delay

    if monday?(returned_date) do
      trunc(original_fee / 2.0)
    else
      original_fee
    end
  end

  defp only_day(datetime) do
    NaiveDateTime.to_date(datetime)
  end
end
