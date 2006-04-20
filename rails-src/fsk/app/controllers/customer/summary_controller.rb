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
    @region = get_user_region
    #@allocations = get_allocations_for_region(region)
    @report = RegionalReport.new(@region)
  end
  
  def local_summary
    @title = "Local Summary"
    if (get_user.role.name == "regional" or get_user.role.name == "national")
      if (account_no = params[:account_no])
        session[:victim_id] = get_user_by_account_no(account_no).userID
      end
      session[:victim_id] = params[:user_id] || session[:victim_id]
    else
      session[:victim_id] = get_user_id
    end
    @allocations = Allocation.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
    @staff = get_staff(session[:victim_id])
    
    @kit_orders = KitOrder.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
    @total_ordered = 0 
    @kit_orders.each{|o| @total_ordered += o.total_kits}
    @total_allocated = 0 
    @allocations.each {|allocation| @total_allocated += allocation.total_kits}
    @product_orders = ProductOrder.find(:all, :conditions => ["ssm_id = ?", session[:victim_id]])
    
    @show_create_allocation_link = true
    if get_user.role.name == "local" && @allocations.size > 0
      @show_create_allocation_link = false
    end
  end
  
  
  def list_regional_staff
    @title = "Staff List"
    region = params[:region]
    @staff = Staff.find(:all, :conditions => ["region = ?", region])
    render :action => "staff_search"
  end
  
  def staff_search
    @title = "Staff List"
    last_name = params[:search][:last_name]
    @staff = Staff.find(:all, :conditions => ["lastName like ?", last_name + '%'], :order => "lastName ASC")
  end
  
  def boom
    raise "boom!"
  end
  
  private
  def get_allocations_for_region(region)
    @allocations = Allocation.find(:all, :conditions => ["region_id = ?", region])
  end
  
end
