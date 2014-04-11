require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get theatre" do
    get :theatre
    assert_response :success
  end

end
