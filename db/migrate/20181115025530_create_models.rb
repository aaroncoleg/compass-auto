class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.references :make, foreign_key: true
      t.string :model_name

      t.timestamps
    end
  end
end
