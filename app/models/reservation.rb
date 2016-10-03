class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates :booking_date, :presence => true
  validates :start_time, :presence => true, inclusion: { in: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23] }
  validates :end_time, :presence => true, inclusion: { in: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] }
  validate :start_must_be_before_end
  validates :status, :presence => true

  private

  def start_must_be_before_end
    @valid = :start_time.to_i < :end_time.to_i and :end_time.to_i <= ( :start_time.to_i + 2 )
    errors.add(:start_time, 'must be before end time') unless @valid
  end

end
