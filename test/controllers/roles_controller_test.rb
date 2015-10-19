require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_recept)
    @admin = users(:user_admin)
    sign_in @admin
    @role_admin = roles(:role_admin)
    @role_recept = roles(:role_recept)
    @role = @role_recept
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post :create, role: { description: @role.description, name: @role.name }
    end

    assert_redirected_to role_path(assigns(:role))
  end

  test "should NOT create duplicate role" do
    assert_difference('Role.count',1) do
      role_hash = { description: @role.description, name: @role.name }
      post :create, role: role_hash
    end
    assert_no_difference('Role.count') do
      role_hash = { description: @role.description, name: @role.name }
      post :create, role: role_hash
    end
  end

  test "should show role" do
    get :show, id: @role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role
    assert_response :success
  end

  test "should update role" do
    role_hash = { description: @role.description, name: @role.name + '1' }
    patch :update, id: @role, role: role_hash
    assert_equal 200, response.status
  end

  test "should destroy @role_recept" do
    assert_difference('Role.count', -1) do
      delete :destroy, id: @role_recept
    end

    assert_redirected_to roles_path
  end
end
