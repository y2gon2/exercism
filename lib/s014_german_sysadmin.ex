defmodule Username do
  @moduledoc """
  Exercise Learning goals
  * Charlists
  * Case
  (https://exercism.org/tracks/elixir/exercises/german-sysadmin)
  """

  def sanitize([]), do: []
  def sanitize([head | tail]) do
    letter =
      case head do
        ?ä -> 'ae'  # ?char - code 값으로 전환
        ?ö -> 'oe'  # 'chars' - char list 로 전환
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> '_'
        x when (x >= ?a and x <= ?z) -> [x]
        _ -> ''
      end

    letter ++ sanitize(tail)
  end
end
