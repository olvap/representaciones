require 'test_helper'

class Wholesalers::InvoicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:operators)
    assert assigns(:operators) == Wholesaler.all
  end
end
