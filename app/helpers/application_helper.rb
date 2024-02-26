module ApplicationHelper
  def wrapper_class
    if controller_name == 'sessions' or controller_name == 'users' && action_name == 'show'
      'wrapper_sign_in_up'
    else
      'wrapper'
    end
  end
  
end
