defmodule LogParser do
  @moduledoc """
  * Regular Expressions
  (https://exercism.org/tracks/elixir/exercises/log-parser)
  """

  def valid_line?(line) do
    String.match?(line, ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/)
  end

  def split_line(line) do
    Regex.split(~r{<[~*=-]*>}, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r{end\-of\-line\d+}i, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.scan(~r/User\s+(\S+)/u, line) do
      [[_, username]] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
