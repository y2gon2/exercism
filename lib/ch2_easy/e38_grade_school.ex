defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    %{}
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    same_name = Map.values(school)
    |> flatten([])
    |> Enum.any?(&(&1 == name))

    if same_name do
      {:error, school}
    else
      case grade(school, grade) do
        [] -> {:ok, Map.put(school, grade, [name])}
        names -> {:ok, Map.put(school, grade, [name | names])}
      end
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    case Map.get(school, grade) do
      nil -> []
      names -> Enum.sort(names)
    end
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    Map.values(school)
    |> flatten([])
  end

  defp flatten([], result), do: result
  defp flatten([head | tail], result), do: flatten(tail, result ++ Enum.sort(head))

  # 다른 풀이
  # https://exercism.org/tracks/elixir/exercises/grade-school/solutions/jeferson-brito
end
