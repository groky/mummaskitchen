require 'test_helper'

class CustomerControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
