class AddHomeTypeToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :home_type, :string
  end
end
