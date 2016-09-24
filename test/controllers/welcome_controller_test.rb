require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :home
    assert_response :success
  end

end
