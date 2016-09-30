require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
  end

  test 'should get sales' do
    get :sales
    assert_response :success
  end

  test 'should get purchaces' do
    get :purchaces
    assert_response :success
  end
end
