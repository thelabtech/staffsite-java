class Customer::OrderController < ApplicationController

  def index

  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :create_kit_order, :create_product_order, :update_kit_order, :update_product_order ],
         :redirect_to => { :action => :place_kit_order }

  def place_kit_order
    place_order('kit')
  end
  def place_product_order
    place_order('individual')
  end
  def place_order(type)
    session[:line_errors] = nil
    session[:bad_items] = nil
    @title = "New Order"
    @order ||= Order.new
    # create an empty array of products
    @products = Array.new
    if (params[:products])
      params[:products].each do |key,value|
        @products[key.to_i] = value.to_i
      end
    else
      Product.find(:all, :conditions => ["availability = ? OR availability = 'both'", type]).each do |product|
        @products[product.id] = 0
      end
    end
  end

  def create_kit_order
    if params
      @order = KitOrder.new(params[:order])
      create('kit_order')
    else
      #go back to creating an order
      redirect_to :action => 'place_kit_order'
    end
  end
  def create_product_order
    @order = ProductOrder.new(params[:order])
    create('product_order')
  end
  def create(type)
    @order.ssm_id = session[:victim_id]
    @order.order_year = get_year
    if @order.save 
      if save_line_items && @order.valid?
        session[:line_errors] = nil
        session[:bad_items] = nil
        flash[:notice] = 'Order was successfully created.'
        redirect_to :controller => 'summary', :action => 'local_summary'
        return
      else
        session[:products] = params[:products]
        redirect_to :action => 'edit_kit_order', :id => @order.id
        return
      end
    else
      send('place_'+type)
      render :action => 'place_'+type
    end
  end

  def edit_kit_order
    edit
  end
  def edit_product_order
    edit
  end
  def edit
    @order ||= Order.find(params[:id])
    # create an array of products and quantities
    @products = Array.new
    if posted = session[:products] || params[:products]
      posted.each do |key,value|
        @products[key.to_i] = value.to_i
      end
      session[:products] = nil
    else
      Product.find(:all).each do |product|
        @products[product.id] = @order.product_quantity(product.id)
      end
    end
  end

  def update_kit_order
    update('kit_order')
  end
  def update_product_order
    update('product_order')
  end
  
  def update(type)
    @order = Order.find(params[:id])
    if save_line_items && @order.update_attributes(params[:order]) && @order.valid?
      flash[:notice] = 'Order was successfully saved.'
      session[:line_errors] = nil
      session[:bad_items] = nil
      redirect_to :controller => 'summary', :action => 'local_summary'
      return
    else
      send('edit_'+type)
      render :action => 'edit_'+type
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  private
  def save_line_items
    line_errors = []
    bad_items = []
    params[:products].each do |key,value|
      # see if the line item is already a part of this order
      if !(item = @order.line_items.detect {|i| i.product_id == key.to_i})
        item = LineItem.new(:product_id => key, :quantity => value.to_i, :order_id => @order.id)
      end
      item.quantity = value.to_i
      unless item.save
        item.errors.each{|e| line_errors << e} 
        bad_items << item.product_id
      end
    end
    session[:line_errors] = line_errors
    session[:bad_items] = bad_items
    return line_errors.size == 0
  end
end
