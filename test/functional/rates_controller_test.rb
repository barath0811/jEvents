require 'test_helper'

class RatesControllerTest < ActionController::TestCase
  setup do
    @rate = rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rate" do
    assert_difference('Rate.count') do
      post :create, rate: { max_total_budget: @rate.max_total_budget, min_total_budget: @rate.min_total_budget, nonveg_plate_cost: @rate.nonveg_plate_cost, veg_plate_cost: @rate.veg_plate_cost }
    end

    assert_redirected_to rate_path(assigns(:rate))
  end

  test "should show rate" do
    get :show, id: @rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rate
    assert_response :success
  end

  test "should update rate" do
    put :update, id: @rate, rate: { max_total_budget: @rate.max_total_budget, min_total_budget: @rate.min_total_budget, nonveg_plate_cost: @rate.nonveg_plate_cost, veg_plate_cost: @rate.veg_plate_cost }
    assert_redirected_to rate_path(assigns(:rate))
  end

  test "should destroy rate" do
    assert_difference('Rate.count', -1) do
      delete :destroy, id: @rate
    end

    assert_redirected_to rates_path
  end
end
