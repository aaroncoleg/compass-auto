class Customer < ApplicationRecord
  belongs_to :state
  def full_name
    "#{first_name} #{last_name}"
  end
end
