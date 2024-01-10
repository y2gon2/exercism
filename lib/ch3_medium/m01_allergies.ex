defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  (https://exercism.org/tracks/elixir/exercises/allergies)
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags), do: list(flags, [])

  defp list(flag, allergies) do
    cond do
      flag >= 256 -> list(flag - 256, allergies)
      flag >= 128 -> list(flag - 128, ["cats" | allergies])
      flag >= 64 -> list(flag - 64, ["pollen" | allergies])
      flag >= 32 -> list(flag - 32, ["chocolate" | allergies])
      flag >= 16 -> list(flag - 16, ["tomatoes" | allergies])
      flag >= 8 -> list(flag - 8, ["strawberries" | allergies])
      flag >= 4 -> list(flag - 4, ["shellfish" | allergies])
      flag >= 2 -> list(flag - 2, ["peanuts" | allergies])
      flag >= 1 -> list(flag - 1, ["eggs" | allergies])
      flag == 0 -> allergies
    end
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    list(flags)
    |> Enum.any?(&(&1 == item))
  end
end
