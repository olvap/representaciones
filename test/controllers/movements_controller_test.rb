require 'test_helper'

class MovementsControllerTest < ActionController::TestCase

  test "should create movement" do
    operator = operators(:operadora)
    @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'

    assert_difference('Movement.count') do
      post :create, movement: { monto: 111 },
        operator_id: operator.id
    end

    assert_redirected_to :back
  end
end
