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

  validates_presence_of :name, null: false, uniqueness: true
  validates :name, length: { maximum: 35 }
  validates :pet_type, inclusion: { in: ['dog','cat','bird'] }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_presence_of :breed #, null: false
end
