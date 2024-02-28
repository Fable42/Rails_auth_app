class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :email, :tag, :password, :password_confirmation)

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: 'User signed up'
    else

      #@user.errors.full_messages.each do |message|
      #  flash.now[:error] = message
      #end

      flash.now[:error] = @user.errors.full_messages

      render :new, status: 422

    end
  end
end
