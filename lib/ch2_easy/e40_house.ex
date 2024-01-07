defmodule House do
  @verbs %{1 => "lay in", 2 => "ate", 3 => "killed", 4 => "worried", 5 => "tossed",
 6 => "milked", 7 => "kissed", 8 => "married", 9 => "woke", 10 => "kept", 11 => "belonged to"}
  @subfix %{
    1 => "house that Jack built",
    2 => "malt",
    3 => "rat",
    4 => "cat",
    5 => "dog",
    6 => "cow with the crumpled horn",
    7 => "maiden all forlorn",
    8 => "man all tattered and torn",
    9 => "priest all shaven and shorn",
    10 => "rooster that crowed in the morn",
    11 => "farmer sowing his corn",
    12 => "horse and the hound and the horn",
  }
  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  (https://exercism.org/tracks/elixir/exercises/house)
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    song = for number <- start..stop do
      make_part(1, number, "")
    end

    Enum.join(song)
  end

  defp make_part(from, number, result) when from > number, do: result <> ".\n"
  defp make_part(from, number, result) do
    case from do
      1 -> make_part(2, number, "This is the #{@subfix[number]}")
      _ -> make_part(
        from + 1,
        number,
        result <> " that #{@verbs[number - from + 1]} the #{@subfix[number - from + 1]}"
        )
    end
  end

  # 다른 풀이
  # https://exercism.org/tracks/elixir/exercises/house/solutions/TLShowtime
end
