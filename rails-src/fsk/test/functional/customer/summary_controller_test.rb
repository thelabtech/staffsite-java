require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/summary_controller'

# Re-raise errors caught by the controller.
class Customer::SummaryController; def rescue_action(e) raise e end; end

class Customer::SummaryControllerTest < Test::Unit::TestCase

  fixtures :fsk_users, :fsk_allocations, :fsk_orders, :ministry_RegionalTeam, :staffsite_staffsiteprofile, :simplesecuritymanager_user, :ministry_staff
  def setup
    @controller = Customer::SummaryController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @request.session[:cas_receipt] = {:user => 'josh.starcher@uscm.org'}
  end

  # Replace this with your real tests.
  def test_local_summary
    get :local_summary, {:account_no => '000000125'}
    assert_response :success
    assert_template "local_summary"
    
    get :local_summary, {:account_no => '000000126'}
    assert_response :success
    assert_template "note"
  end
  
  def test_regional_summary
    get :regional_summary
    assert_response :success
    assert_template "regional_summary"
  end
  
  def test_national_summary
    get :national_summary
    assert_response :success
    assert_template "national_summary"
  end
  
  def test_list_regional_staff
    get :list_regional_staff
    assert_response :success
    assert_template "staff_search"
  end

  def test_list_regional_staff
    get :staff_search
    assert_response :success
    assert_template "staff_search"
  end
  
end
