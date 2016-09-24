class Room < ActiveRecord::Base

  has_many :reservations

  validates :number, :presence => true, length: { maximum: 140 }
  validates :size, :presence => true
  validates :building, :presence => true

end
