class Customer::AllocationController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  before_filter :standard_info
  
  private
  def standard_info
    @user = get_user
    @regions = Region.standard_regions
  end

  public
  
  def list
    @allocation_pages, @allocations = paginate :allocations, :per_page => 10
  end

  def show
    @allocation = Allocation.find(params[:id])
    @user = get_user
  end

  def new
    @allocation = Allocation.new
    #region_id and ssm_id really only useful for local users:
    @allocation.region_id = get_region_id
    @allocation.ssm_id = session[:victim_id] || get_user.user.id
    @allocation.attributes = check_params(params[:allocation])
  end

  def create
    @allocation = Allocation.new()
    @allocation.allocation_year = get_year
    @allocation.region_id = get_region_id
    @allocation.ssm_id = get_user.user.id
    @allocation.attributes = check_params(params[:allocation])
    if (get_user.can_modify_allocation?(@allocation) and @allocation.save)
      flash[:notice] = 'Allocation was successfully created.'
      redirect_to :controller => "summary", :action => "local_summary"
    else
      render :action => 'new'
    end
  end

  def edit
    @allocation = Allocation.find(params[:id])
  end
  
  def update
    @allocation = Allocation.find(params[:id])
    if (not get_user.can_modify_allocation?(@allocation))
      flash[:notice] = 'You may not modify this allocation'
      @user = get_user
      render :action => 'edit'
    elsif (not @allocation.update_attributes(check_params(params[:allocation])))
      render :action => 'edit'
    else
      flash[:notice] = 'Allocation was successfully updated.'
      redirect_to :controller => "summary", :action => "local_summary"
    end
  end

  def destroy
    Allocation.find(params[:id]).destroy
    redirect_to :action => 'list'
  end


  private
  #ensure that only legal fields are modified
  def check_params(input)
    if input
      checked_params = Hash.new
      input.each do |key, value|
        if get_user.can_modify_field?(key)
          checked_params[key] = value
        end
      end
      return checked_params
    end
  end

  def get_region_id
    region = Region.find(:first, :conditions => ["region = ?", get_user_region])
    if region
      region.teamID
    else
      Region.find(:first, :conditions => "region = 'NC'").teamID
    end
  end
end
