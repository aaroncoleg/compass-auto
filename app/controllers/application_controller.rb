class ApplicationController < ActionController::Base
  helper ApplicationHelper

  def after_sign_in_path_for(resource)
    account_show_path
  end
end
