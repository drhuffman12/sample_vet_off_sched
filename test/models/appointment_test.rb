require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # appointment.date_of_visit:

  test "a appointment with missing date_of_visit does not save" do
    appointment = appointments(:one)
    appointment.date_of_visit = nil
    assert !(appointment.save), __method__
  end

  test "an appointment with date_of_visit in the PAST does not save" do
    appointment = appointments(:date_past)
    assert !(appointment.save), __method__
  end

  test "an appointment with date_of_visit in the FUTURE does save" do
    appointment = appointments(:date_future)
    assert (appointment.save), __method__
  end

  # appointment.pet:

  test "a appointment with missing pet does not save" do
    appointment = appointments(:one)
    appointment.pet = nil
    assert !(appointment.save), __method__
  end

  # appointment.user (customer):

  test "a appointment with missing user does not save" do
    appointment = appointments(:one)
    appointment.user = nil
    assert !(appointment.save), __method__
  end

  test "a appointment with user missing role of 'cust' does not save" do
    appointment = appointments(:one)
    # appointment.user = users(:one)
    # appointment.user.roles = nil
    assert !(appointment.save), __method__
  end

  # test "a appointment with user having role of 'cust' does save" do
  #   appointment = appointments(:appt_cust)
  #   assert (appointment.user.roles.include?('cust')), __method__
  #   appointment.user.roles = ['cust']
  #   assert (appointment.save), __method__
  # end

end
