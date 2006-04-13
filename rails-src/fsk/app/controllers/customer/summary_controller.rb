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
  
  
  def national_summary
    @title = "National Summary"
    #assert get_user.role.name == "national"
    @report = NationalReport.new
  end
  
  def regional_summary
    @title = "Regional Summary"
    #assert get_user.role.name == "regional"
    region = get_user_region
    #@allocations = get_allocations_for_region(region)
    @report = RegionalReport.new(region)
  end
  
  def local_summary
    @title = "Local Summary"
    if (get_user.role.name == "regional" or get_user.role.name == "national")
      session[:victim_id] = params[:user_id] || session[:victim_id]
    else
      session[:victim_id] = session[:user].userID
    end
    @allocations = Allocation.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
    @staff = get_staff(session[:user].userID)
    puts "victim id: " + session[:victim_id].to_s
    puts "allocations: " + @allocations.size.to_s
    @kit_orders = KitOrder.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
    @product_orders = ProductOrder.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
  end
  
  
  private
  def get_allocations_for_region(region)
    @allocations = Allocation.find(:all, :conditions => ["region_id = ?", region])
  end
  
end
