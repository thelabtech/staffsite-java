require File.dirname(__FILE__) + '/../test_helper'

class ProductOrderTest < Test::Unit::TestCase
  fixtures :fsk_orders, :fsk_products, :fsk_line_items
   
  def test_total_cost
    order = Order.find(39)
    assert_equal 1533, order.cost 
  end
end
