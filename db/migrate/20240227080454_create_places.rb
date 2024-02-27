class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|

      t.string :description
      t.string :photo
      t.string :location
      t.integer :rate
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
