class ProductOrder < Order
  # Total cost of all line_items
  def cost
    if @order_cost.nil?
      @order_cost = 0
      line_items.each do |item|
        @order_cost += (item.product.price * item.quantity) unless item.product.nil?
      end
    end
    @order_cost.to_i
  end
  
  # Return the total items for this order
  def total_items
    @total_items ||= line_items.inject {|sum, item| sum + item.quantity}
  end
end
