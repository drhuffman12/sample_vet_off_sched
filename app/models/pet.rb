# == Schema Information
#
# Table name: pets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(35)
#  pet_type   :string
#  breed      :string(35)
#  age        :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :appointments

  validates_presence_of :name, uniqueness: true
  validates :name, length: { maximum: 35 }
  # validates :pet_type, inclusion: { in: Pet.pet_types }
  validates :pet_type, inclusion: { in: ['dog','cat','bird'] }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_presence_of :breed

  # Pet.pet_owner_ids
  def self.pet_owner_ids
    owners = self.where.not(user_id: nil).select(:user_id).all
    (owners.empty?) ? nil : owners.pluck(:user_id).to_a.sort.uniq
  end

  # Pet.pet_owners
  def self.pet_owners
    (self.pet_owner_ids) ? User.where(["id IN (?)", self.pet_owner_ids]) : []
  end

  # # Pet.pet_types
  # def self.pet_types
  #   ['dog','cat','bird']
  # end
end
