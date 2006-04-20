require File.dirname(__FILE__) + '/../test_helper'

class ProductOrderTest < Test::Unit::TestCase
  fixtures :fsk_orders, :fsk_products, :fsk_line_items
   
  def test_total_cost
    order = Order.find(39)
    assert order.cost == 1593
  end
end
