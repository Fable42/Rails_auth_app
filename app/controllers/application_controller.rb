class ApplicationController < ActionController::Base

  helper_method: current_user
  private

 # фунция которая определяен айди юзера с нынешней сиссии или возвращает нил елси это гость (||= или равно)
  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
