require 'test_helper'

class RelationshipControllerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get put" do
    get :put
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
