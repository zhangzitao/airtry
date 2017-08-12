class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :room, foreign_key: true
      t.references :reservation, foreign_key: true
      t.references :guest, foreign_key: { to_table: :users }
      t.references :host, foreign_key: { to_table: :users }
      t.string :type

      t.timestamps
    end
  end
end
