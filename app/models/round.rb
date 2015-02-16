class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :solutions#, :dependent => :destroy

end
