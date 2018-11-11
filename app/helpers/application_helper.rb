module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def check_lvl(lvl)
    if(user_signed_in? && Role.find(current_user.role_id).level >= lvl)
      true
    else
      false
    end
  end

  def equivalent_interest_rate(rate)
    12*((1+rate/100/4.0)**(4.0/12)-1)
  end

  def due_calc(rate, years, price)
    puts price
    number_with_precision((rate * price)/ (12 * (1- (1+(rate/12))**(-12 * years)))*years*12, :precision => 2)
  end
end
