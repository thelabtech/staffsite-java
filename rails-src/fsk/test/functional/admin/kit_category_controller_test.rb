require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/kit_category_controller'

# Re-raise errors caught by the controller.
class Admin::KitCategoryController; def rescue_action(e) raise e end; end

class Admin::KitCategoryControllerTest < Test::Unit::TestCase
  fixtures :kit_categories

  def setup
    @controller = Admin::KitCategoryController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
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

    assert_not_nil assigns(:kit_categories)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:kit_category)
    assert assigns(:kit_category).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:kit_category)
  end

  def test_create
    num_kit_categories = KitCategory.count

    post :create, :kit_category => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_kit_categories + 1, KitCategory.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:kit_category)
    assert assigns(:kit_category).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil KitCategory.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      KitCategory.find(1)
    }
  end
end
