class User < ActiveRecord::Base

  # # has_and_belongs_to_many :roles, join_table: :rights
  # has_many :rights, :dependent => :destroy
  # has_many :roles, through: :rights
  # accepts_nested_attributes_for :rights, :roles

  has_many :pets
  has_many :appointments

  validates_presence_of :name, null: false
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5 }
  validates :years_in_practice, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
