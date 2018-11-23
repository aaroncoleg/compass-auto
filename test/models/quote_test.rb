require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Equivalent Interest Rate" do
    assert Quote.equivalent_interest_rate(4.0).round(6) == 0.039867
  end

  test "Price with tax" do
    q = Quote.new
    q.price = 1000
    assert q.price_with_tax == 1043
  end

  test "Price with markup" do
    assert Quote.calc_price(1) == 1082
  end
end
