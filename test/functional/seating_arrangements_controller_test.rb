require 'test_helper'

class SeatingArrangementsControllerTest < ActionController::TestCase
  setup do
    @seating_arrangement = seating_arrangements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seating_arrangements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seating_arrangement" do
    assert_difference('SeatingArrangement.count') do
      post :create, seating_arrangement: { capacity: @seating_arrangement.capacity, type: @seating_arrangement.type }
    end

    assert_redirected_to seating_arrangement_path(assigns(:seating_arrangement))
  end

  test "should show seating_arrangement" do
    get :show, id: @seating_arrangement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seating_arrangement
    assert_response :success
  end

  test "should update seating_arrangement" do
    put :update, id: @seating_arrangement, seating_arrangement: { capacity: @seating_arrangement.capacity, type: @seating_arrangement.type }
    assert_redirected_to seating_arrangement_path(assigns(:seating_arrangement))
  end

  test "should destroy seating_arrangement" do
    assert_difference('SeatingArrangement.count', -1) do
      delete :destroy, id: @seating_arrangement
    end

    assert_redirected_to seating_arrangements_path
  end
end
