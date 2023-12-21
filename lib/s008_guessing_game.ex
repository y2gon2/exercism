defmodule GuessingGame do
  @moduledoc """
  Exercise Learning goals
  * Multiple Clause Functions (Open-Closed Principle practices by allowing functions to have multiple clauses)
  * Guards (o prevent Elixir from invoking functions based on evaluation of the arguments by guard functions)
  * Default Arguments
  (https://exercism.org/tracks/elixir/exercises/guessing-game)
  """

  def compare(secret_number, guess) when secret_number == guess do
    # Please implement the compare/2 function
    "Correct"
  end

  def compare(secret_number, guess) when secret_number < guess - 1 do
    # Please implement the compare/2 function
    "Too high"
  end

  def compare(secret_number, guess) when secret_number > guess + 1 do
    # Please implement the compare/2 function
    "Too low"
  end

  def compare(secret_number, guess) when secret_number == guess + 1 or secret_number == guess - 1 do
    # Please implement the compare/2 function
    "So close"
  end

  def compare(_secret_number) do
    # Please implement the compare/2 function
    "Make a guess"
  end

  def compare(_secret_number, guess) when guess == :no_guess do
    # Please implement the compare/2 function
    "Make a guess"
  end
end
