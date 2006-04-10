class Order < ActiveRecord::Base
  set_table_name	"fsk_Orders"
  
  belongs_to :user, :foreign_key => "ssm_id"
  has_many :line_items
  
  validates_presence_of :location_name, :contact_first_name, :contact_last_name,
                        :contact_phone, :contact_email, :ship_name, :ship_address1,
                        :ship_city, :ship_state, :ship_zip, :ship_phone
  
  # Return the order quantity for a product
  def product_quantity(product)
      if @quantities.nil?
        @quantities = Array.new
        line_items.each do |item| 
          @quantities[item.product_id] = item.quantity
        end
      end
      @quantities[product]
  end
  
  # Total cost of all line_items
  def cost
    if @order_cost.nil?
      @order_cost = 0
      line_items.each do |item|
        @order_cost += (item.product.price * item.quantity)
      end
    end
    @order_cost.to_i
  end
end
