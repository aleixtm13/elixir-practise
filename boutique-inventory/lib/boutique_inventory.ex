defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory,
    fn(item1, item2) ->
      if item1.price == item2.price do
        item1.name > item2.name
      else
        item1.price < item2.price
      end
    end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn(item) -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn (item) ->
      Map.update!(item, :name,
        fn (name) ->
          String.replace(name, old_word, new_word)
        end
      )
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size,
      fn (quantity_by_size) ->
      Enum.into(
        Enum.map(item[:quantity_by_size],
          fn {size, quantity} ->
          {size, quantity + count}
        end), %{})
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_, quantity}, acc -> acc + quantity end)
  end
end
