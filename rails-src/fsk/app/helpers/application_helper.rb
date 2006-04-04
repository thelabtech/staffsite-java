# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_user
    return FskUser.find(:first, :conditions => ["ssm_id = ?", get_user_id])
  end

  def get_user_id
    return session[:userID]
  end
end
