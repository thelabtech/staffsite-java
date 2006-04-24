# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'cas'
class ApplicationController < ActionController::Base
  before_filter CAS::CASFilter, :authenticate, :authorize, :except => 'list'
  include ExceptionNotifiable	#Automatically generates emails of errors
  private
  
  def authenticate 
    unless session[:user]
    #todo: lookup by guid
      if session[:cas_receipt] && session[:cas_receipt][:user]
        session[:user] = User.find_by_username(session[:cas_receipt][:user])
        if session[:user].nil? then raise session.inspect end
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
  
  def redirect_to_login(msg = nil)
	flash[:notice] = msg if msg
	redirect_to(:controller => "/login", :action => "login")
	return false
  end
  
  def get_year
    year = DateTime::now.year.to_s
  end
  
  def get_user_region
    staff = get_staff(get_user_id)
    staff.region
  end

  def get_staff(ssm_id)
    Staff.get_staff(ssm_id)
  end
  
  #ssm user, not FskUser
  def get_user_by_account_no(account_no)
    if account_no.nil? then raise "nil account_no!" end
    profile = StaffsiteProfile.find(:first, :conditions => ["accountNo = ?", account_no])
    if profile
      username = profile.userName
      return User.find(:first, :conditions => ["username = ?", username])
    end
    return nil
  end

  # the FskUser associated with the currently logged in user
  def get_user
    user = FskUser.find(:first, :conditions => ["ssm_id = ?", get_user_id], :include => :role)
    if (user.nil?)
      ssm_user = session[:user]
      user = FskUser.new({:user => ssm_user})
      user.role = Role.find(:first, :conditions => ["name = ?", "local"])
    end
    return user
  end

  def get_user_id
    return session[:user].userID
  end
end
