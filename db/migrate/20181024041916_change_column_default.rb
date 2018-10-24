class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role_id, :integer, default: 1
  end
end
