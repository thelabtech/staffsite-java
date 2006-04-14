require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/order_controller'

# Re-raise errors caught by the controller.
class Customer::OrderController; def rescue_action(e) raise e end; end

class Customer::OrderControllerTest < Test::Unit::TestCase
  def setup
    @controller = Customer::OrderController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_place_kit_order
    get :place_kit_order
  end
  
  def test_place_product_order
  end
  
  def test_create_kit_order
  end
  
  def test_create_product_order
  end
  
  def test_edit_kit_order
  end
  
  def test_edit_product_order
  end
  
  def test_update_kit_order
  end
  
  def test_update_product_order
  end
end
