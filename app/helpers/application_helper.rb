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
end
