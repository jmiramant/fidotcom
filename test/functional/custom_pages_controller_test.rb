require 'test_helper'

class CustomPagesControllerTest < ActionController::TestCase
  test "should get flm" do
    get :flm
    assert_response :success
  end

end
