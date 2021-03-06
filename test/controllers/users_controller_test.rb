require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:user_recept)
    @admin = users(:user_admin)
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      user_hash = { address: @user.address, email: 'a' + @user.email, city: @user.city, name: 'a' + @user.name, school: @user.school, state: @user.state, years_in_practice: @user.years_in_practice, zip: @user.zip, password: '12345678' }
      post :create, user: user_hash
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address: @user.address, city: @user.city, name: @user.name, school: @user.school, state: @user.state, years_in_practice: @user.years_in_practice, zip: @user.zip }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
