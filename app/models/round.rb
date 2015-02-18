class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  has_many :solutions#, :dependent => :destroy

end
