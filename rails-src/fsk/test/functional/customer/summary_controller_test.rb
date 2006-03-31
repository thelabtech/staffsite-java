require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/summary_controller'

# Re-raise errors caught by the controller.
class Customer::SummaryController; def rescue_action(e) raise e end; end

class Customer::SummaryControllerTest < Test::Unit::TestCase
  def setup
    @controller = Customer::SummaryController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
