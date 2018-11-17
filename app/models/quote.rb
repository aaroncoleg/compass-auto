class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory

  def self.equivalent_interest_rate(rate)
    12*((1+rate/100/4.0)**(4.0/12)-1)
  end

  def self.due_calc(rate, years, price)
    rate * price/ (12 * (1- (1+(rate/12))**(-12 * years)))*years*12
  end

  def get_tax
    price * 0.043
  end
end
