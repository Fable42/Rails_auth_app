class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :email, :tag)

    User.create(user_params)

    redirect_to new_session_path
  end
end
