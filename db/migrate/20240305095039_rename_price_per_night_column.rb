class RenamePricePerNightColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :places, :price_per_night, :pricepernight
  end
end
