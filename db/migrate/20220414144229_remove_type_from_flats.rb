class RemoveTypeFromFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :type, :string
  end
end
