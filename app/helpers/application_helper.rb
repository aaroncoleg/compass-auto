module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def check_lvl(lvl)
    current_lvl = Role.find(current_user.role_id).level
    if(user_signed_in? && (current_lvl == lvl || current_lvl == 6))
      true
    else
      false
    end
  end

  def check_lvl_min(lvl)
    if(user_signed_in? && Role.find(current_user.role_id).level >= lvl)
      true
    else
      false
    end
  end
end
