defmodule HighSchoolSweetheart do
  @moduledoc """
  Exercise Learning goals
  * Strings
  * Pipe Operator
  (https://exercism.org/tracks/elixir/exercises/high-school-sweetheart)
  """

    def first_letter(name) do
      name |> String.trim() |> String.at(0)
    end

    def initial(name) do
      first_upper_letter = name |> first_letter() |> String.upcase()
      first_upper_letter <> "."
    end

    def initials(full_name) do
      [first, last] = String.split(full_name, " ")
      initial(first) <> " " <> initial(last)
    end

    def pair(full_name1, full_name2) do
      initials1 = initials(full_name1)
      initials2 = initials(full_name2)

      """
      ******       ******
    **      **   **      **
  **         ** **         **
 **            *            **
 **                         **
 **     #{initials1}  +  #{initials2}     **
  **                       **
    **                   **
      **               **
        **           **
          **       **
            **   **
              ***
               *
 """
    end
end
