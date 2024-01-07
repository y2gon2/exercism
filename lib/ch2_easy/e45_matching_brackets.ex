defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  (https://exercism.org/tracks/elixir/exercises/matching-brackets)
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    brackets(String.codepoints(str), [])
  end

  defp brackets([], []), do: true
  defp brackets([], _wait_for_close_list), do: false
  defp brackets([head | tail], stack) do
    case head do
      head when head in ["(", "{", "["] -> brackets(tail, [head | stack])
      ")" -> if length(stack) > 0 and hd(stack) == "(", do: brackets(tail, tl(stack)), else: false
      "}" -> if length(stack) > 0 and hd(stack) == "{", do: brackets(tail, tl(stack)), else: false
      "]" -> if length(stack) > 0 and hd(stack) == "[", do: brackets(tail, tl(stack)), else: false
      _ -> brackets(tail, stack)
    end

  end
end
