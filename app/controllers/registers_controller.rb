class RegistersController < ApplicationController
  allow_unauthenticated_access
  
  def show
    if @current_user.present?
      redirect_to projects_path, notice: "You are already registered." and return
    end
    @user = User.new
  end
end
