class Game < ActiveRecord::Base
  has_many :rounds#, :dependent => :destroy
  has_many :players
end
