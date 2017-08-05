class CreateRoomphotos < ActiveRecord::Migration[5.1]
  def change
    create_table :roomphotos do |t|
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
