require 'test_helper'

class MatcherControllerTest < ActionController::TestCase
  test "should get generate" do
    get :generate
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
