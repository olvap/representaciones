require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  include RequireAuthentication

  setup do
    @operator = operators(:retailer)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operator" do
    assert_difference('Retailer.count') do
      post :create, retailer:
        { name: @operator.name, tax_category: @operator.tax_category }
    end

    assert_redirected_to retailer_path(assigns(:operator))
  end

  test "should show operator" do
    get :show, id: @operator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operator
    assert_response :success
  end

  test "should update operator" do
    patch :update, id: @operator, retailer: { name: @operator.name }
    assert_redirected_to retailer_path(assigns(:operator))
  end

  test "should destroy operator" do
    assert_difference('Retailer.count', -1) do
      delete :destroy, id: @operator
    end

    assert_redirected_to retailers_path
  end
end
