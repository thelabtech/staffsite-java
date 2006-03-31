require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/allocation_controller'

# Re-raise errors caught by the controller.
class Customer::AllocationController; def rescue_action(e) raise e end; end

class Customer::AllocationControllerTest < Test::Unit::TestCase
  def setup
    @controller = Customer::AllocationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
