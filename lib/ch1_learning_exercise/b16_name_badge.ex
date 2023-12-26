defmodule NameBadge do
  @moduledoc """
  Exercise Learning goals
  * Nil
  * If
  (https://exercism.org/tracks/elixir/exercises/name-badge)
  """
  def print(id, name, department) do
    "#{new_employee(id)}#{name} - #{owner(department)}"
  end

  defp new_employee(id) do
    if id == nil do
      ""
    else
      "[#{id}] - "
    end
  end

  defp owner(department) do
    if department == nil do
      "OWNER"
    else
      String.upcase(department)
    end
  end
end
