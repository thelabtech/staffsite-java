require File.dirname(__FILE__) + '/../../test_helper'
require 'customer/allocation_controller'

# Re-raise errors caught by the controller.
class Customer::AllocationController; def rescue_action(e) raise e end; end

class Customer::AllocationControllerTest < Test::Unit::TestCase
  fixtures :fsk_allocations

  def setup
    @controller = Customer::AllocationController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    
    @request.session[:cas_receipt] = {:user => 'josh.starcher@uscm.org'}
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:allocations)
  end

  def test_show
    get :show, {:id => 1}

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:allocation)
    assert assigns(:allocation).valid?
  end

  def test_new
    get :new, {}

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:allocation)
  end

  def test_create
    num_allocations = Allocation.count

    @alloc = {:ssm_id => 1, :impact_allotment => 100}
    post :create, @alloc

    successful_allocation_crud

    assert_equal num_allocations + 1, Allocation.count
  end

  def test_edit
    get :edit, {:id => 1}

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:allocation)
    assert assigns(:allocation).valid?
  end

  def test_update
    @alloc = {:id => 1, :ssm_id => 1, :impact_allotment => 200}
    post :update, @alloc
    successful_allocation_crud
  end

  def test_destroy
    assert_not_nil Allocation.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Allocation.find(1)
    }
  end
end
