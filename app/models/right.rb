# == Schema Information
#
# Table name: rights
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Right < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates_uniqueness_of :role, scope: :user

end
