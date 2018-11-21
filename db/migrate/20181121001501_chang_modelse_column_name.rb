class ChangModelseColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :models, :model_name, :name
  end
end
