# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_user_role
    return session[:role]
  end
  
end
