class Inventory < ApplicationRecord
  belongs_to :make
  belongs_to :model
  belongs_to :color

  has_one_attached :photo

  validates :vin,
            presence: true,
            length: {maximum: 17},
            on: :create,
            allow_nil: false


  def self.find_by_vehicle(vehicle_make_search, vehicle_model_search)
  Customer.where(["name LIKE ?",vehicle_make_search]).where(["name LIKE ?",vehicle_model_search])
  end

end
