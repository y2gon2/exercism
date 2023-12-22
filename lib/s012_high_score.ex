defmodule HighScore do
@moduledoc """
Exercise Learning goals
* Maps
* Module Attributes As Constants
(https://exercism.org/tracks/elixir/exercises/high-score)
"""
  @default_number 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_number ) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_number)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
