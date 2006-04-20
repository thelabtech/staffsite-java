require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/order_controller'

# Re-raise errors caught by the controller.
class Customer::OrderController; def rescue_action(e) raise e end; end

class Customer::OrderControllerTest < Test::Unit::TestCase
  fixtures :simplesecuritymanager_user, :fsk_products, :fsk_kit_categories, :fsk_orders
  def setup
    @controller = Customer::OrderController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @kit_order = {"order"=>
                          {"ship_address1"=>"123 Somewhere St", 
                           "ship_phone"=>"32423-1", 
                           "ship_address2"=>"#3304", 
                           "project_id"=>"4", 
                           "ship_zip"=>"12231", 
                           "contact_cell"=>"777-HEAVEN", 
                           "total_kits"=>"1000", 
                           "operating_unit"=>"2", 
                           "business_unit"=>"1", 
                           "ship_state"=>"AK", 
                           "contact_last_name"=>"You", 
                           "ship_name"=>"Matt Drees", 
                           "ship_city"=>"Jupiter", 
                           "type"=>"KitOrder", 
                           "contact_phone"=>"555-LOVE", 
                           "contact_first_name"=>"Me", 
                           "contact_email"=>"josh.starcher@uscm.org", 
                           "dept_id"=>"3", 
                           "location_name"=>"Here"}, 
                        "products"=>
                          {"1"=>"1000",
                           "2"=>"0", 
                           "3"=>"1000",
                           "4"=>"1000",
                           "5"=>"0"}
                      }
    @product_order = @kit_order
    @product_order["order"]["type"] = "ProductOrder"
    
    @request.session[:cas_receipt] = {:user => 'josh.starcher@uscm.org'}
  end

  def test_place_kit_order
    get :place_kit_order
    assert_response :success
  end
  
  def test_place_product_order
    get :place_product_order
    assert_response :success
  end
  
  def test_create_kit_order
    post :create_kit_order, @kit_order
    successful_order
  end
  
  def test_create_kit_order_with_bad_order
    post :create_kit_order
    assert_response :success
    assert assigns["order"].errors.count == 13
  end
  
  def test_create_product_order
    post :create_kit_order, @product_order
    successful_order
  end
  
  def test_edit_kit_order
    get :edit_kit_order, {:id => 38}
    assert_response :success
  end
  
  def test_edit_product_order
    get :edit_product_order, {:id => 39}
    assert_response :success
  end
  
  def test_update_kit_order
    @kit_order["id"] = 38
    post :update_kit_order, @kit_order
    successful_order
  end
    
  def test_update_kit_order_with_too_many_of_an_item_in_a_category
    @kit_order["products"]["5"] = 500
    @kit_order["id"] = 38
    post :update_kit_order, @kit_order
    assert_response :success
    assert assigns["order"].errors.count == 1
  end
  
  def test_update_product_order
    @product_order["id"] = 39
    post :update_kit_order, @product_order
    successful_order
  end
  
  def test_update_product_order_quantity_not_mod_100
    @product_order["id"] = 39
    @product_order["products"]["5"] = 1    
    post :update_product_order, @product_order
    assert_response :success
    assert session[:line_errors].size == 1
  end
  
  def test_update_product_order_quantity_too_large
    @product_order["id"] = 39
    @product_order["products"]["5"] = 100000   
    post :update_product_order, @product_order
    assert_response :success
    assert session[:line_errors].size == 1
  end
end
