defmodule LogLevel do
  @moduledoc """
    Exercise Learning goals
    * Atoms
    * Cond
    * Instructions
    (https://exercism.org/tracks/elixir/exercises/log-level)
  """

  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      level == 0 and legacy? == false -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and legacy? == false -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    result = to_label(level, legacy?)

    cond do
      result == :error or result == :fatal -> :ops
      result == :unknown and legacy? == true -> :dev1
      result == :unknown -> :dev2
      true -> false
    end
  end
end
