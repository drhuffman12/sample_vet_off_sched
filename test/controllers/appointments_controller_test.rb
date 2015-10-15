require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:user_admin)
    # sign_in users(:appt_cust)
    # sign_in users(:one)
    # @appointment = appointments(:one)
    # @appointment = appointments(:appt_cust)
    @appointment = appointments(:appt_admin)
    # @user = users(:user_cust)
    # @pet = pets(:pet_cust)
    # @role = roles(:role_cust)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, appointment: { date_of_visit: @appointment.date_of_visit, pet_id: @appointment.pet_id, reason: @appointment.reason, reminder: @appointment.reminder, user_id: @appointment.user_id }
    end

    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should show appointment" do
    get :show, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    patch :update, id: @appointment, appointment: { date_of_visit: @appointment.date_of_visit + 1, pet_id: @appointment.pet_id, reason: @appointment.reason, reminder: @appointment.reminder, user_id: @appointment.user_id }
    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to appointments_path
  end
end
