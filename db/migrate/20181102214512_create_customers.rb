class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :street_address
      t.string :city
      t.references :state, foreign_key: true
      t.string :zip_code
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
