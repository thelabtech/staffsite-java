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
    region = get_user_region
    @allocations = get_allocations_for_region(user)
    
  end
  
  def local_summary
    #assert get_user.role.name == "local"
    #todo: handle multiple allocations
    @allocation = Allocation.find(:first, :conditions => ["ssm_id = ?", get_user.user.id])
    
  end
  

end
