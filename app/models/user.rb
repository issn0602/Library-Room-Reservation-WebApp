class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :reservations

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

end
