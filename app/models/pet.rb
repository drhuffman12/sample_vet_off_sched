class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :appointments

  validates_presence_of :name, null: false
  validates :name, length: { maximum: 35 }
  validates :pet_type, inclusion: { in: ['dog','cat','bird'] }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_presence_of :breed #, null: false
end
