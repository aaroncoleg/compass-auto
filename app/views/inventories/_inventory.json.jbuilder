json.extract! inventory, :id, :year, :make_id, :model_id, :color_id, :mileage, :wholesale_price, :vin, :sold, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
