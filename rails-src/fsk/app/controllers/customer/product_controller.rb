class Customer::ProductController < ApplicationController
  def index
    list
    render(:action => 'list')
  end
  
  def list
    @categories = KitCategory.find(:all)
    render(:action => 'list', :layout => false)
  end
  
  def show_description
    @item = Product.find(params[:product_id])
    @all_items = Product.find(:all, :conditions => ["availability = ? OR availability = 'both'", params[:type]])
  end
end
