class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|

      t.date :start_date
      t.date :end_date
      t.decimal :price , precision: 10, scale: 2
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :place, null: false, foreign_key: { to_table: :places }

      t.timestamps
    end
  end
end
