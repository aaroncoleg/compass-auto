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
end
