class User < ActiveRecord::Base
  # belongs_to :role
  has_many :roles

  validates_presence_of :name, null: false
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5 }
  validates :years_in_practice, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
