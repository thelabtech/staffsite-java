class Admin::KitCategoryController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @kit_category_pages, @kit_categories = paginate :kit_categories, :per_page => 10
  end

  def show
    @kit_category = KitCategory.find(params[:id])
  end

  def new
    @kit_category = KitCategory.new
  end

  def create
    @kit_category = KitCategory.new(params[:kit_category])
    if @kit_category.save
      flash[:notice] = 'KitCategory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @kit_category = KitCategory.find(params[:id])
  end

  def update
    @kit_category = KitCategory.find(params[:id])
    if @kit_category.update_attributes(params[:kit_category])
      flash[:notice] = 'KitCategory was successfully updated.'
      redirect_to :action => 'show', :id => @kit_category
    else
      render :action => 'edit'
    end
  end

  def destroy
    KitCategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
