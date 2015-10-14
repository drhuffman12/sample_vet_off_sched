# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ActiveRecord::Base

  # # has_and_belongs_to_many :users, join_table: :rights
  # has_many :rights, :dependent => :destroy
  # has_many :users, through: :rights
  # accepts_nested_attributes_for :rights, :users

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :name, :in => %w( admin recept dr cust )

end
