require 'test_helper'

class RundesControllerTest < ActionController::TestCase
  setup do
    @runde = rundes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rundes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runde" do
    assert_difference('Runde.count') do
      post :create, runde: { buchstabe: @runde.buchstabe, fluss: @runde.fluss, land: @runde.land, punkte: @runde.punkte, stadt: @runde.stadt }
    end

    assert_redirected_to runde_path(assigns(:runde))
  end

  test "should show runde" do
    get :show, id: @runde
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runde
    assert_response :success
  end

  test "should update runde" do
    patch :update, id: @runde, runde: { buchstabe: @runde.buchstabe, fluss: @runde.fluss, land: @runde.land, punkte: @runde.punkte, stadt: @runde.stadt }
    assert_redirected_to runde_path(assigns(:runde))
  end

  test "should destroy runde" do
    assert_difference('Runde.count', -1) do
      delete :destroy, id: @runde
    end

    assert_redirected_to rundes_path
  end
end
