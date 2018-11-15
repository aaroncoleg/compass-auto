class Inventory < ApplicationRecord
  belongs_to :make
  belongs_to :model
  belongs_to :color

  has_one_attached :photo

end
