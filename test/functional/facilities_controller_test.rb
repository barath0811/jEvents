require 'test_helper'

class FacilitiesControllerTest < ActionController::TestCase
  setup do
    @facility = facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facility" do
    assert_difference('Facility.count') do
      post :create, facility: { has_buffet: @facility.has_buffet, has_parking: @facility.has_parking, is_alcohol_allowed: @facility.is_alcohol_allowed, is_nonveg_allowed: @facility.is_nonveg_allowed }
    end

    assert_redirected_to facility_path(assigns(:facility))
  end

  test "should show facility" do
    get :show, id: @facility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facility
    assert_response :success
  end

  test "should update facility" do
    put :update, id: @facility, facility: { has_buffet: @facility.has_buffet, has_parking: @facility.has_parking, is_alcohol_allowed: @facility.is_alcohol_allowed, is_nonveg_allowed: @facility.is_nonveg_allowed }
    assert_redirected_to facility_path(assigns(:facility))
  end

  test "should destroy facility" do
    assert_difference('Facility.count', -1) do
      delete :destroy, id: @facility
    end

    assert_redirected_to facilities_path
  end
end
