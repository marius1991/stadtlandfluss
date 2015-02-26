class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players
  has_many :scores

  validates :max_round_count ,
            :presence => {:message => "darf nicht leer sein"}
            #:format =>{ :with => [1234],


  validates :max_round_count, inclusion: { in: 1..4 }

end
