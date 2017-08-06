class AddFieldsToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :longtitude, :float
    add_column :rooms, :latitude, :string
  end
end
