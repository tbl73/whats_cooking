require 'test_helper'

class LibraryControllerTest < ActionController::TestCase
  test "should get mylibrary" do
    get :mylibrary
    assert_response :success
  end

end
