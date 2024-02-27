class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    # &. помогает не ловить ошибку если user == nill
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'User signed in'
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    flash[:notice] = 'User logged out'
    redirect_to action: "new"
  end
end
