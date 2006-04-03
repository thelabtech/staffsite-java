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
  end

  def create
    @allocation = Allocation.new(params[:allocation])
    if @allocation.save
      flash[:notice] = 'Allocation was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @allocation = Allocation.find(params[:id])
  end

  def update
    @allocation = Allocation.find(params[:id])
    if @allocation.update_attributes(params[:allocation])
      flash[:notice] = 'Allocation was successfully updated.'
      redirect_to :action => 'show', :id => @allocation
    else
      render :action => 'edit'
    end
  end

  def destroy
    Allocation.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
