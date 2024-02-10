class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id

      redirect_to '/'
    else
      redirect_to session_path
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
