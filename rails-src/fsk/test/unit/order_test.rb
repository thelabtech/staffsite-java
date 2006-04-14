require File.dirname(__FILE__) + '/../test_helper'

class OrderTest < Test::Unit::TestCase
  fixtures :fsk_orders, :fsk_products, :fsk_lineitems
  
  def test_product_quantity
    order = Order.find(38)
    assert order.product_quantity(1) == 1000
  end

end
