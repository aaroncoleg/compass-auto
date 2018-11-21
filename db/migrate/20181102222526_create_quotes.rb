class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :customer, foreign_key: true
      t.references :inventory, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.boolean :sold

      t.timestamps
    end
  end
end
