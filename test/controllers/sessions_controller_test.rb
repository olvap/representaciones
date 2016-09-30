require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "with valid credentials sign the user in" do
    post :create, email: users(:admin).email,
                  password: 'secret'
    assert_equal users(:admin).id, session[:user_id]
    assert_equal 'Iniciaste sesion correctamente', flash[:notice]
  end

  test "should get delete" do
    session[:user_id] = users(:admin).id
    delete :destroy, id: users(:admin).id
    assert_nil session[:user_id]
  end

end
