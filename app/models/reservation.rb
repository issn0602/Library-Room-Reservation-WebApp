class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates :booking_date, :presence => true
  validates :start_time, :presence => true, inclusion: { in: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23] }
  validates :end_time, :presence => true, inclusion: { in: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] }, :greater_than => :start_time
  # validates :valid_times
  validates :status, :presence => true

  def valid_times
    if start_time >= end_time
      self.errors.add :start_time, ' has to be after end time'
    end
  end

end
