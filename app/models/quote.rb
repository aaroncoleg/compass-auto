class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory
end
