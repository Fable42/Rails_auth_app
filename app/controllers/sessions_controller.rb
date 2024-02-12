class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
