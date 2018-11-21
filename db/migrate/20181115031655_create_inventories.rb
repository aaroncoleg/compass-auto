class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :year
      t.references :make, foreign_key: true
      t.references :model, foreign_key: true
      t.references :color, foreign_key: true
      t.integer :mileage
      t.decimal :wholesale_price, :precision => 8, :scale => 2
      t.string :vin
      t.boolean :sold

      t.timestamps
    end
  end
end
