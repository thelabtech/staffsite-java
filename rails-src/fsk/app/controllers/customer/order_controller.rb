class Customer::OrderController < ApplicationController
  def index

  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @order_pages, @orders = paginate :orders, :per_page => 10
  end

  def show
    @order = Order.find(params[:id])
  end

  def place_kit_order
    place_order
  end
  def place_product_order
    place_order
  end
  def place_order  
    @order = Order.new
    # create an empty array of products
    @products = Array.new
    Product.find(:all).each do |product|
      @products[product.id] = 0
    end
  end

  def create_kit_order
    @order = KitOrder.new(params[:order])
    create(kit_order)
  end
  def create_product_order
    @order = ProductOrder.new(params[:order])
    create(product_order)
  end
  def create(type)
    @order.ssm_id = session[:victim_id]
    @order.order_year = get_year
    if @order.save
      save_line_items
      flash[:notice] = 'Order was successfully created.'
      redirect_to :action => 'list'
    else
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
    @order = Order.find(params[:id])
    # create an array of products and quantities
    @products = Array.new
    Product.find(:all).each do |product|
      @products[product.id] = @order.product_quantity(product.id)
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
    if @order.update_attributes(params[:order])
      save_line_items
      flash[:notice] = 'Order was successfully updated.'
      redirect_to :controller => 'summary'
      return
    else
      redirect_to :action => 'edit_'+type
      return
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  private
  def save_line_items
    #breakpoint
    params[:products].each do |key,value|
      LineItem.create(:product_id => key, :quantity => value, :order_id => @order.id)
    end
  end
end
