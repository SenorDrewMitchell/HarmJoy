require 'test_helper'

class RaceDaysControllerTest < ActionController::TestCase
  setup do
    @race_day = race_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:race_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race_day" do
    assert_difference('RaceDay.count') do
      post :create, race_day: { name: @race_day.name, race_date: @race_day.race_date, race_id: @race_day.race_id }
    end

    assert_redirected_to race_day_path(assigns(:race_day))
  end

  test "should show race_day" do
    get :show, id: @race_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race_day
    assert_response :success
  end

  test "should update race_day" do
    patch :update, id: @race_day, race_day: { name: @race_day.name, race_date: @race_day.race_date, race_id: @race_day.race_id }
    assert_redirected_to race_day_path(assigns(:race_day))
  end

  test "should destroy race_day" do
    assert_difference('RaceDay.count', -1) do
      delete :destroy, id: @race_day
    end

    assert_redirected_to race_days_path
  end
end
