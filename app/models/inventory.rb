class Inventory < ApplicationRecord
  belongs_to :color
  belongs_to :make
end
