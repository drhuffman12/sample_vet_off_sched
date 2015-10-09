require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a role with an invalid name does not save" do
    role = Role.new(name: 'foo')
    assert !(role.save), __method__
    role = roles(:invalid)
    assert !(role.save), __method__
    role = roles(:missing_name)
    assert !(role.save), __method__
  end

  test "a role with an valid name does save" do
    %w( admin recept dr cust ).each do |role_name|
      role = Role.new(name: role_name)
      assert (role.save), __method__
    end
  end

  test "the roles are seeded" do
    seed_data
    roles = Role.select(:name).all.collect{|role| role.name}
    assert_equal [], (%w( admin recept dr cust ) - roles), __method__
  end

end
