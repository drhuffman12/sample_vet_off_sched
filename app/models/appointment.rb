# == Schema Information
#
# Table name: appointments
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  pet_id        :integer
#  date_of_visit :datetime
#  reminder      :boolean
#  reason        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates_presence_of :user
  validates_presence_of :pet
  validates_presence_of :date_of_visit
  validates_presence_of :reason
  validates_inclusion_of :reminder, :in => [true, false]

  validate :date_of_visit_in_future

  def date_of_visit_in_future
    unless (date_of_visit && date_of_visit.in_time_zone.future?)
      errors.add(:date_of_visit, "Please schedule the appointment for a future date & time")
    end
  end

  validate :pet_owner

  def pet_owner
    if (user && pet)
      if user.pets.empty?
        errors.add(:user_id, "'#{user.name}' has no pets")
      else
        errors.add(:pet_id, "'#{pet.name}' is not owned by user '#{user.name}'") unless user.pets.collect{|pet| pet.id}.include?(pet_id)
      end
    else
      errors.add(:user_id, "Customer Missing") unless user
      errors.add(:pet_id, "Pet Missing") unless pet
    end
  end

end
