class User < ActiveRecord::Base
  belongs_to :game
  has_many :rounds
  has_secure_password
  validates_presence_of :password, :on => :create
end
