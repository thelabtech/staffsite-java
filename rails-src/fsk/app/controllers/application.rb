# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'cas'
class ApplicationController < ActionController::Base
  before_filter CAS::CASFilter, :authenticate, :authorize
	
  def authenticate 
    unless session[:user]
      if session[:cas_receipt][:user]
        session[:user] = User.find_by_username(session[:cas_receipt][:user])
      else 
        #we've got a problem
        raise "Cas Authentication Failure"
      end
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
    staff = get_staff(session[:user].userID)
    staff.region
  end

  def get_staff(ssm_id)
    ssm_user = User.find(:first, :conditions => ["userID = ?", ssm_id])
    username = ssm_user.username
    profile = StaffsiteProfile.find(:first, :conditions => ["userName = ?", username])
    accountNo = profile.accountNo
    staff = Staff.find(:first, :conditions => ["accountNo = ?", accountNo])
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
    return session[:user].userID
  end
end