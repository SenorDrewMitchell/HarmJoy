require 'test_helper'

class MomentTypesControllerTest < ActionController::TestCase
  setup do
    @moment_type = moment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moment_type" do
    assert_difference('MomentType.count') do
      post :create, moment_type: { description: @moment_type.description, name: @moment_type.name }
    end

    assert_redirected_to moment_type_path(assigns(:moment_type))
  end

  test "should show moment_type" do
    get :show, id: @moment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moment_type
    assert_response :success
  end

  test "should update moment_type" do
    patch :update, id: @moment_type, moment_type: { description: @moment_type.description, name: @moment_type.name }
    assert_redirected_to moment_type_path(assigns(:moment_type))
  end

  test "should destroy moment_type" do
    assert_difference('MomentType.count', -1) do
      delete :destroy, id: @moment_type
    end

    assert_redirected_to moment_types_path
  end
end
