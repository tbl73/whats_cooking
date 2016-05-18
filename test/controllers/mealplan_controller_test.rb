require 'test_helper'

class MealplanControllerTest < ActionController::TestCase
  test "should get display" do
    get :display
    assert_response :success
  end

  test "should get generate" do
    get :generate
    assert_response :success
  end

end
