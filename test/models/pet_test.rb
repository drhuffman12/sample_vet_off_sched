require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @valid_pet_types = ['dog','cat','bird']
    @invalid_pet_types = @valid_pet_types.collect{ |pt| pt + 'x' }
  end

  # pet.name:

  test "a pet with missing a name does not save" do
    pet = pets(:pet_missing_name)
    assert !(pet.save), __method__
  end

  test "a pet with a name LESS than 35 chars does save" do
    pet = pets(:name_len_lt_35)
    assert_equal 34, (pet.name.length)
    assert (pet.save), __method__
  end

  test "a pet with a name EQUAL to 35 chars does save" do
    pet = pets(:name_len_eq_35)
    assert_equal 35, (pet.name.length)
    assert (pet.save), __method__
  end

  test "a pet with a name GREATER than 35 chars does not save" do
    pet = pets(:name_len_gt_35)
    assert_equal 36, (pet.name.length)
    assert !(pet.save), __method__
  end

  # pet.pet_type:

  test "a pet with a pet_type in ['dog','cat','bird'] does save" do
    pet = pets(:name_len_eq_35)
    @valid_pet_types.each do |pet_type|
      pet.pet_type = pet_type
      assert (pet.save), __method__
    end
  end

  test "a pet with a pet_type NOT in ['dog','cat','bird'] does not save" do
    pet = pets(:name_len_eq_35)
    @invalid_pet_types.each do |pet_type|
      pet.pet_type = pet_type
      assert !(pet.save), __method__
    end
  end

  # pet.breed:

  test "a pet with missing breed does not save" do
    pet = pets(:pet_missing_name)
    pet.name = 'foo'
    pet.breed = nil
    assert !(pet.save), __method__
  end

  # pet.age:

  test "a pet with missing age does not save" do
    pet = pets(:pet_missing_name)
    pet.name = 'foo'
    pet.age = nil
    assert !(pet.save), __method__
  end

  test "a pet with negative age does not save" do
    pet = pets(:pet_missing_name)
    pet.name = 'foo'
    pet.age = -1
    assert !(pet.save), __method__
  end

  # pet.weight:

  test "a pet with missing weight does not save" do
    pet = pets(:pet_missing_name)
    pet.name = 'foo'
    pet.weight = nil
    assert !(pet.save), __method__
  end

  test "a pet with negative weight does not save" do
    pet = pets(:pet_missing_name)
    pet.name = 'foo'
    pet.weight = -1
    assert !(pet.save), __method__
  end

end
