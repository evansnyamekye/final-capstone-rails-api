class AddPricePerNightToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :price_per_night, :decimal, precision: 10, scale: 2
  end
end
