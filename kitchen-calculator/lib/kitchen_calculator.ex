defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_unit, value} = volume_pair
    value
  end

  def to_milliliter(volume_pair) do
    {unit, value} = volume_pair
    converted_value = case unit do
      :cup -> value * 240
      :fluid_ounce -> value * 30
      :teaspoon -> value * 5
      :tablespoon -> value * 15
      :milliliter -> value
    end
    {:milliliter, converted_value}
  end

  def from_milliliter(volume_pair, unit) do
    {_, value} = volume_pair
    converted_value = case unit do
      :cup -> value / 240
      :fluid_ounce -> value / 30
      :teaspoon -> value / 5
      :tablespoon -> value / 15
      :milliliter -> value
    end
    {unit, converted_value}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
