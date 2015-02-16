require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get regeln" do
    get :regeln
    assert_response :success
  end

  test "should get impressum" do
    get :impressum
    assert_response :success
  end

  test "should get ueber_uns" do
    get :ueber_uns
    assert_response :success
  end

end
