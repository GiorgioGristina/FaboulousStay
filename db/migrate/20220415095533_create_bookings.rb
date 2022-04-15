class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true
      t.integer :total_price
      t.integer :number_of_nights

      t.timestamps
    end
  end
end
