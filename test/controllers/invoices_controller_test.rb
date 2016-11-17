require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  include RequireAuthentication

  test "GET export" do
    get :export
    assert_response :success
  end
end
