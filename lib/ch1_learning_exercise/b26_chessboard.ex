defmodule Chessboard do
  @moduledoc """
  Exercise Learning goals
  * Ranges ... (ex. 1..5)
  (https://exercism.org/tracks/elixir/exercises/chessboard)
  """

  def rank_range, do: 1..8

  def file_range, do: ?A..?H

  def ranks, do: rank_range() |> Enum.to_list

  def files, do: file_range() |> Enum.map(&<<&1>>)
end
