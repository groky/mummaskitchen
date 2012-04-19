require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get menu" do
    get :menu
    assert_response :success
  end

  test "should get dishes" do
    get :dishes
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

end
