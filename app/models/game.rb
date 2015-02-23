class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players
  has_many :scores
end
