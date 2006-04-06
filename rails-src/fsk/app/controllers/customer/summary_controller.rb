class Customer::SummaryController < ApplicationController
  
  def index
    case get_user.role.name
    when "national"
      national_summary
      render :action => "national_summary"
    when "regional"
      regional_summary
      render :action => "regional_summary"
    when "local"
      local_summary
      render :action => "local_summary"
    else
      raise "Bad User Type"
    end
  end
  
  private
  def national_summary
    #assert get_user.role.name == "national"
    
  end
  
  def regional_summary
    #assert get_user.role.name == "regional"
    
  end
  
  def local_summary
    #assert get_user_role == "regional"
    
  end
  
  
  
end
