defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  (https://exercism.org/tracks/elixir/exercises/matrix)

  다른 풀이 (https://exercism.org/tracks/elixir/exercises/matrix/solutions)
  """
  @spec from_string(input :: String.t()) :: any()
  def from_string(input) do
    String.split(input, "\n")
    |> Enum.map(&String.split(&1, " ") |> Enum.map(fn e -> String.to_integer(e) end))

  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    rows = for row <- matrix do
      Enum.join(row, " ")
    end

    Enum.join(rows, "\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.fetch!(matrix, index - 1)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    for index <- 1..length(Enum.fetch!(matrix, 0)) do
      column(matrix, index)
    end
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    Enum.map(matrix, &Enum.fetch!(&1, index - 1))
  end
end
