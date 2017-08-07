class AddFieldsToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :longitude, :float
    add_column :rooms, :latitude, :float
  end
end
