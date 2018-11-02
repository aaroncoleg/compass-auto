class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :miles
      t.integer :year
      t.string :model
      t.integer :vin
      t.boolean :sold
      t.decimal :price
      t.references :color, foreign_key: true
      t.references :make, foreign_key: true

      t.timestamps
    end
  end
end
