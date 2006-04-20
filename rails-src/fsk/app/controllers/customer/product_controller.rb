class Customer::ProductController < ApplicationController
  def index
    list
    render(:action => 'list')
  end
  
  def list
    @categories = KitCategory.find(:all)
    render(:action => 'list', :layout => false)
  end
end
