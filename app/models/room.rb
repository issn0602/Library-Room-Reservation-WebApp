class Room < ActiveRecord::Base

  has_many :reservations,:dependent => :destroy

  validates :number, :presence => true, length: { maximum: 140 }
  validates :size, :presence => true
  validates :building, :presence => true

end
