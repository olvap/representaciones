require 'test_helper'

class Retailers::InvoicesControllerTest < ActionController::TestCase
  include RequireAuthentication

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:operators)
    assert assigns(:operators) == Retailer.all
  end
end
