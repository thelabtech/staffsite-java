# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  before_filter :authenticate, :except => :login
  before_filter :authorize
	
  def authenticate 
    unless session[:user_id]
      session[:jumpto] = request.parameters
      return redirect_to_login("Please log in")
    else
      @person = @me = @my = User.find(session[:user_id]).person
      @my_entry = true
	end
  end
  
  def authorize
    #user = 
    #session[:role] = role
  end
  
  private
  def redirect_to_login(msg = nil)
	flash[:notice] = msg if msg
	redirect_to(:controller => "/login", :action => "login")
	return false
  end
  
  def get_year
    year = DateTime::now.year.to_s
  end
  
  def get_user_region
    username = get_user.user.username
    profile = StaffsiteProfile.find(:first, :conditions => ["userName = ?", username])
    accountNo = profile.accountNo
    staff = Staff.find(:first, :conditions => ["accountNo = ?", accountNo])
    staff.region
  end
  
  def get_user
    user = FskUser.find(:first, :conditions => ["ssm_id = ?", get_user_id], :include => :role)
    if (user.nil?)
      ssm_user = User.find(:first, :conditions => ["userID = ?", get_user_id])
      user = FskUser.new({:user => ssm_user})
      user.role = Role.find(:first, :conditions => ["name = ?", "local"])
    end
    return user
  end

  def get_user_id
    return session[:user_id]
  end
end