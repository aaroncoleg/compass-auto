class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory

  def self.equivalent_interest_rate(rate)
    12*((1+rate/100/4.0)**(4.0/12)-1)
  end

  def self.due_calc(rate, years, price)
    rate * price/ (12 * (1- (1+(rate/12))**(-12 * years)))*years*12
  end

  def price_with_tax
    price * 0.043 + price
  end

  def self.total_sales
    Quote.sum(:price, :conditions => {:sold => true})
  end

  def self.total_sales_tax
    total_sales * 0.043
  end

  def self.whole_sale_total
    Inventory.sum(:whole_sale_price, :conditions => {:sold => true})
  end

  def self.total_interest
    number_with_precision(Quote.due_calc(rate, @years, quote.price).to_f, :precision => 2).to_f - Quote.price.to_f
  end

  def self.net_profit_margin
    total_sales_tax
    end



end
