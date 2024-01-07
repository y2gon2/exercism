defmodule Garden do
  @students [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.
    (https://exercism.org/tracks/elixir/exercises/kindergarten-garden)

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    mapping(make_plant_group(info_string), Enum.sort(student_names), Map.new())
  end

  defp mapping(_, [], result), do: result
  defp mapping([], [hd_name | tl_name], result), do: mapping([], tl_name, Map.put(result, hd_name, {}))
  defp mapping([hd_info | tl_info], [hd_name | tl_name], result) do
    mapping(tl_info, tl_name, Map.put(result, hd_name, hd_info))
  end

  defp make_plant_group(""), do: []
  defp make_plant_group(info_string) do
    [line1, line2] = String.split(info_string, "\n")

    first = String.codepoints(line1) |> Enum.chunk_every(2)
    second = String.codepoints(line2) |> Enum.chunk_every(2)

    Enum.zip(first, second)
    |> Enum.map(fn {[e1, e2], [e3, e4]} -> {matching(e1), matching(e2), matching(e3), matching(e4)} end)
  end

  defp matching(char) do
    case char do
      "C" -> :clover
      "G" -> :grass
      "R" -> :radishes
      "V" -> :violets
    end
  end

  # 다른 풀이
  # https://exercism.org/tracks/elixir/exercises/kindergarten-garden/solutions/danferreira
end
