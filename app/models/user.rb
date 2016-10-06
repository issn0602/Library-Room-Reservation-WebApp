class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :reservations,:dependent => :destroy


  validates :password, :confirmation => true
  #validates :password_confirmation, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

end
