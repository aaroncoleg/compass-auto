json.extract! customer, :id, :last_name, :first_name, :street_address, :city, :state_id, :zip_code, :phone_number, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
