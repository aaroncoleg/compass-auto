class Customer < ApplicationRecord
  belongs_to :state

  def self.find_by_name(first_name_search, last_name_search)
    Customer.where(["first_name LIKE ?",first_name_searh]).where(["last_name LIKE ?",last_name_search])
  end

  def full_name
    first_name + " " + last_name
  end
end
