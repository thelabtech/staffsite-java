class Customer::AllocationController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @allocation_pages, @allocations = paginate :allocations, :per_page => 10
  end

  def show
    @allocation = Allocation.find(params[:id])
  end

  def new
    @allocation = Allocation.new
    @user = get_user
  end

  def create
    @allocation = Allocation.new(check_params(params[:allocation]))
    @allocation.allocationYear = get_year
    if (get_user.can_modify_allocation?(@allocation) and @allocation.save)
      flash[:notice] = 'Allocation was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @allocation = Allocation.find(params[:id])
    @user = get_user
  end
  
  def update
    @allocation = Allocation.find(params[:id])
    if (get_user.can_modify_allocation?(@allocation) and 
        @allocation.update_attributes(check_params(params[:allocation])))
      flash[:notice] = 'Allocation was successfully updated.'
      redirect_to :action => 'show', :id => @allocation.id
    else
      render :action => 'edit'
    end
  end

  def destroy
    Allocation.find(params[:id]).destroy
    redirect_to :action => 'list'
  end


  private
    #ensure that only legal fields are modified
  def check_params(input)
    checked_params = Hash.new
    input.each do |key, value|
      if get_user.can_modify_field?(key)
        checked_params[key] = value
      end
    end
    return checked_params
  end
end
