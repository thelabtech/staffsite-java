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
end