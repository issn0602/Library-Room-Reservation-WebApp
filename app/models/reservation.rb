class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates :booking_date, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :status, :presence => true
end
