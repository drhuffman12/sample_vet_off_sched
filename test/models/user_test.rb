# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # user.name:

  test "a user missing a name does not save" do
    user = users(:missing_name)
    assert !(user.save), __method__
  end

  test "a user with a name LESS than 35 chars does save" do
    user = users(:name_len_lt_35)
    assert_equal 34, (user.name.length)
    assert (user.save), __method__
  end

  test "a user with a name EQUAL to 35 chars does save" do
    user = users(:name_len_eq_35)
    assert_equal 35, (user.name.length)
    assert (user.save), __method__
  end

  test "a user with a name GREATER than 35 chars does not save" do
    user = users(:name_len_gt_35)
    assert_equal 36, (user.name.length)
    assert !(user.save), __method__
  end

  # user.zip:

  test "a user with zip GREATER than 5 does not save" do
    user = users(:missing_name)
    user.name = 'foo'
    user.zip = '123456'
    assert !(user.save), __method__
  end

  test "a user with zip EQUAL to 5 does save" do
    user = users(:missing_name)
    user.name = 'foo'
    user.zip = '12345'
    assert (user.save), __method__
  end

  # user.years_in_practice:

  test "a user with years_in_practice LESS than 1 does not save" do
    user = users(:missing_name)
    user.name = 'foo'
    user.years_in_practice = 0
    assert !(user.save), __method__
  end

  test "a user with years_in_practice BETWEEN 1 and 100 does save" do
    user = users(:missing_name)
    user.name = 'foo'
    user.years_in_practice = 1
    assert (user.save), __method__
    user.years_in_practice = 100
    assert (user.save), __method__
  end

  test "a user with years_in_practice GREATER than 100 does not save" do
    user = users(:missing_name)
    user.name = 'foo'
    user.years_in_practice = 101
    assert !(user.save), __method__
  end
end
