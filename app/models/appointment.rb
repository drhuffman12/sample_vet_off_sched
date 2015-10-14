class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates_presence_of :user
  validates_presence_of :pet

  validate :date_of_visit_in_future

  def date_of_visit_in_future
    unless (date_of_visit && date_of_visit.in_time_zone.future?)
      errors.add(:date_of_visit, "Please schedule the appointment for a future date & time")
    end
  end

end
