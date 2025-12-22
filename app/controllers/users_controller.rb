class UsersController < ApplicationController
  unauthenticated_access_only

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to projects_path, notice: "Welcome to PreTeXt.Plus!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.expect(user: [ :email, :password, :name, :invite_code ])
  end
end
