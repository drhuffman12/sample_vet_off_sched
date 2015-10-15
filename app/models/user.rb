# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string(35)
#  address           :string
#  city              :string
#  state             :string(20)
#  zip               :integer
#  school            :string
#  years_in_practice :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rights, :dependent => :destroy
  has_many :roles, through: :rights
  accepts_nested_attributes_for :rights, :roles

  has_many :pets
  has_many :appointments

  validates_presence_of :name, uniqueness: true
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5 }

  validate :dr_has_years_in_practice

  def dr_has_years_in_practice
    if (roles.collect{|role| role.name}.include?('dr'))
      errors.add(:base, 'Years in Practice must be specified (1..100) for Doctors') unless (years_in_practice.class < Numeric) && ((1..100).to_a.include?(years_in_practice))
    # else
    #   errors.add(:base, 'Years in Practice not applicable unless a Doctor') unless years_in_practice.nil?
    end
  end

  before_save :assign_role

  def assign_role
    # self.role = Role.find_by(name: 'Customer') if self.role.nil?
    self.roles << Role.find_by(name: 'cust') if self.roles.empty?
  end

  def role
    self.roles
  end

end
