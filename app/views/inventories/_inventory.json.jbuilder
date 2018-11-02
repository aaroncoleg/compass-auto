json.extract! inventory, :id, :miles, :year, :model, :vin, :sold, :price, :color_id, :make_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
