class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :number_of_bathrooms
      t.integer :number_of_bedrooms
      t.boolean :wifi
      t.boolean :garden
      t.boolean :hot_tub
      t.boolean :parking
      t.boolean :kitchen
      t.boolean :tv
      t.boolean :aircon
      t.boolean :heating
      t.integer :occupancy
      t.integer :price_per_night
      t.string :address
      t.string :city
      t.string :country
      t.string :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
