defmodule BoutiqueInventory do
  @moduledoc """
  Exercise Learning goals
  * Enum
  (https://exercism.org/tracks/elixir/exercises/boutique-inventory)
  """

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price) ) # &() - capter operator
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn x ->
      new_name = String.replace(x.name, old_word, new_word)
      %{x | :name => new_name}
    end)
  end

  def increase_quantity(item, count) do
    updated_quantities = Map.new(
      item.quantity_by_size, fn {k, v} -> {k, v + count} end
    )
    %{item | quantity_by_size: updated_quantities}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_k, v}, acc -> acc + v end)
  end
end
