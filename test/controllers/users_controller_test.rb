require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get mine" do
    get :mine
    assert_response :success
  end

end
