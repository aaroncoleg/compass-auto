class AccountsController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  respond_to do |format|
    format.html { render :template => account_show_path }
  end
end